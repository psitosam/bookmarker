module Renderer

  def render_object(resource, **options) #get all keyword arguments after resource as options for passing to serializer
    options.merge!(json: resource, root: :data)
    options.merge!(status: :ok) unless options.key?(:status)
    
    render options 
  end 

  def render_errors(errors, status = :unprocessable_entity)
    render json: errors, status: status
  end 
end 

# This module provides a single place where we can modify the payload structure for all API endpoints.