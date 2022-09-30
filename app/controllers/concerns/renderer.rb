module Renderer

  def render_object(resource, **options) #get all keyword arguments after resource as options for passing to serializer
    options.merge!(json: resource, root: :data)
    options.merge!(status: :ok) unless options.key?(:status)
    options.merge!(meta: assign_metadata(resource))

    render options 
  end 

  def render_errors(errors, status = :unprocessable_entity)
    render json: { errors: errors.messages }, status: status 
  end 

  private 

  def assign_metadata(resource)
    count = resource.respond_to?(:count) ? resource.count : 1
    resource_name = (resource.try(:first)&.class || resource.class).to_s

    { resource: resource_name, count: count }
  end 
end 

# This module provides a single place where we can modify the payload structure for all API endpoints.