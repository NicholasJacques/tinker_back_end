require 'rails_helper'

RSpec.describe 'Authentication API' do
  describe 'POST#create' do
    context 'request contains correct email and password' do
      it 'returns token as response' do
        user = create(:user)
        email = user.email
        password = user.password

        post '/api/v1/authentication', params: { email: email, password: password }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to have_key('auth_token')
        expect(parsed_response['auth_token']).to be_a(String)
      end
    end
  end
end
