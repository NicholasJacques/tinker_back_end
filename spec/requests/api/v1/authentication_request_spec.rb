require 'rails_helper'

RSpec.describe 'Authentication API' do
  describe 'POST#create' do
    context 'request contains correct credentials' do
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

    context 'request contains incorrect credentials' do
      it 'returns an error' do
        user = create(:user)
        email = user.email

        post '/api/v1/authentication', params: { email: email, password: 'badpassword' }
        parsed_response = JSON.parse(response.body)

        expect(parsed_response).to have_key('error')
        expect(parsed_response['error']).to eq('Login Unsuccesful')
      end
    end
  end
end
