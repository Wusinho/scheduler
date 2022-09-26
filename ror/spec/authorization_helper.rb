# authorization helper
module AuthorizationHelper
  def create_user
    {
      user: {
        email: 'heberlazoe2@gmail.com',
        name: 'heber',
        last_name: 'lazo',
        username: 'Hlazo',
        password: '345678aA',
        "organization_attributes": {
          "name": 'Nike'
        }
      }
    }
  end

  def sign_up(user)
    post '/api/v1/registrations', params: user
  end

  def auth_for_user(user)
    session_params = {
      user: {
        email: user[:user][:email],
        password: user[:user][:password]
      }
    }
    post '/api/v1/sessions', params: session_params
    JSON.parse(response.body)
  end
end
