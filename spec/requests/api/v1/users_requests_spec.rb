require 'rails_helper'

RSpec.describe 'Users API' do

  describe 'POST#create' do
    context 'with valid params' do
      it 'creates a new user' do
        email = 'test@test.com'
        password = 'test'

        post '/api/v1/users', params: { user: { email: email,
                                                password: password,
                                                password_confirmation: password } }

        parsed_response = JSON.parse(response.body)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response['status']).to eq('User created successfully')
        expect(User.count).to eq(1)
      end
    end
  end
end
