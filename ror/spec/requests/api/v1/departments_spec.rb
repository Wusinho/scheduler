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


    it 'should create a session for the user' do
      deparment_params = {
        "department": {
          "name": 'Science5',
          "supervised_hrs": %w[8-15 11-12]
        }
      }
      post '/api/v1/departments', params: deparment_params,
                                  headers: @auth
      payload = JSON.parse(response.body)
      p payload
    end


  end
end
