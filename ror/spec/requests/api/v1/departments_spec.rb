require 'rails_helper'
require 'authorization_helper'

RSpec.describe 'Api::V1::Departments', type: :request do
  include AuthorizationHelper

  describe 'should register a new user' do
    before(:each) do
      user = create_user
      sign_up(user)
      @auth_tokens = auth_for_user(user)
    end


    it 'should create a session for the user' do
      deparment_params = {
        "department": {
          "name": 'Science5',
          "supervised_hrs": %w[8-15 11-12]
        }
      }
      post '/api/v1/departments', params: deparment_params,
                                  headers: { Authorization: @auth_tokens['token'] }
      payload = JSON.parse(response.body)
      p payload
    end


  end
end
