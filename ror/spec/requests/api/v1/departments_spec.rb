require 'rails_helper'
require 'authorization_helper'

RSpec.describe 'Api::V1::Departments', type: :request do
  include AuthorizationHelper

  describe 'should register a new user' do
    before(:all) do
      user = create_user
      register_user(user)
      auth_tokens = users_session(user)
      @auth = { Authorization: auth_tokens['token'] }
    end


    it 'should create a department for the users organization' do
      deparment_params = {
        "department": {
          "name": 'Science5',
          "supervised_hrs": %w[8-15]
        }
      }
      post '/api/v1/departments', params: deparment_params,
                                  headers: @auth
      payload = JSON.parse(response.body)
      expect(payload['id']).not_to be_nil
      expect(response).to have_http_status(:created)
    end

    it 'should not create a department, it did not pass validations for number of ranges' do
      deparment_params = {
        "department": {
          "name": 'Science51',
          "supervised_hrs": %w[8-12 13-17 18-22]
        }
      }
      post '/api/v1/departments', params: deparment_params,
                                  headers: @auth
      payload = JSON.parse(response.body)
      expect(payload['id']).to be_nil
      expect(payload['supervised_hrs']).to eql ['Can only add up to 2 ranges']
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should not create a department, it did not pass validations for min number of hrs per range' do
      deparment_params = {
        "department": {
          "name": 'Science52',
          "supervised_hrs": %w[3-7 8-9]
        }
      }
      post '/api/v1/departments', params: deparment_params,
                                  headers: @auth
      payload = JSON.parse(response.body)
      expect(payload['id']).to be_nil
      expect(payload['supervised_hrs']).to eql ['Ranges must be greater than 4 hrs']
      expect(response).to have_http_status(:unprocessable_entity)
    end

  end
end
