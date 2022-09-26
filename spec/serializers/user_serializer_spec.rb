# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  let(:user) { build(:user, email: 'user@testemail.test') }
  let(:serialized_user) { described_class.new(user).as_json }
  
  subject{ serialized_user[:user] }

  it 'has an email that matches with the user email' do 
    expect(subject[:email]).to eq('user@testemail.test')
  end 
end
