require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe 'User initializing session' do
    let(:user) { create(:user) }

    it 'should create a session for the user' do
      session_params = {
        user: {
          email: user.email,
          password: '123456aA'
        }
      }

      post '/api/v1/sessions', params: session_params
      payload = JSON.parse(response.body)
      p payload

    end





  end
end
