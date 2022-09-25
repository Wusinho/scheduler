require 'rails_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  describe 'User initializing session' do
    let!(:user) { create(:user) }
    it 'should create a session for the user' do
      session_params = {
        user: {
          email: user.email,
          password: user.password
        }
      }
      post '/api/v1/sessions', params: session_params
      payload = JSON.parse(response.body)
      expect(payload).not_to be_nil
      expect(payload.size).to eql 2
      expect(payload['email']).to eql user.email
      expect(response).to have_http_status(:created)
    end

    it 'should not create a session for the user if email does not match' do
      session_params = {
        user: {
          email: user.email,
          password: 'wrong_password'
        }
      }
      post '/api/v1/sessions', params: session_params
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['error']).to_not be_empty
      expect(response).to have_http_status(:not_found)
    end
  end
end
