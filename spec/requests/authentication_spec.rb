require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let!(:user) { FactoryBot.create(:user, username: 'Bokkseller') }

    it 'authenticate the client' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'Password1' }

      #binding.pry

      expect(response).to have_http_status(:created)
      expect(response_body).to eq({
        'token' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w'
      })
    end

    it 'return error when username is missing' do
      post '/api/v1/authenticate', params: { password: 'Password1' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to include('error')
    end

    it 'returns when password is missing' do
      post '/api/v1/authenticate', params: { username: 'Bokkseller' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to include('error')
    end
  end
end
