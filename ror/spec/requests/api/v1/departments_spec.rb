require 'rails_helper'
require 'authorization_helper'

RSpec.describe 'Api::V1::Departments', type: :request do
  include AuthorizationHelper

  describe 'should register a new user' do
    before(:each) do
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

    it 'should not a department, it did not pass validations' do
      deparment_params = {
        "department": {
          "name": 'Science51',
          "supervised_hrs": %w[8-12 13-17 18-22]
        }
      }
      post '/api/v1/departments', params: deparment_params,
           headers: @auth
      payload = JSON.parse(response.body)
      # p payload
      expect(payload['id']).to be_nil
      # expect(response).to have_http_status(:unprocessable_entity)
    end


  end
end
