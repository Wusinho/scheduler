require 'rails_helper'

RSpec.describe 'Api::V1::Registrations', type: :request do
  describe 'should register a new user' do
    it 'should create a user' do
      user = {
        user: {
          email: 'heberlazo2@gmail.com',
          name: 'Heber',
          last_name: 'Lazo',
          username: 'Hlazo',
          password: '123456'
        }
      }
      post '/api/v1/registrations', params: user
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['id']).not_to be_nil
      expect(payload['id'].length).to eql 36
      expect(payload['sign_in_count']).to eql 1
      expect(response).to have_http_status(:created)
    end

    it 'if a required field is not present it should not create a user' do
      user = {
        user: {
          last_name: 'Lazo',
          username: 'Hlazo',
          password: '123456'
        }
      }
      post '/api/v1/registrations', params: user
      payload = JSON.parse(response.body)
      expect(payload['id']).to be_nil
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
