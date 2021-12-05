require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it 'authenticate the client' do
      post '/api/v1/authenticate', params: { username: 'BallKeeper', password: 'tikazel' }

      expect(response).to have_http_status(:created)
      expect(response_body).to eq({
        'token' => '123'
      })
    end

    it 'return error when username is missing' do
      post '/api/v1/authenticate', params: { password: 'tikazel' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to include('error')
    end

    it 'returns when password is missing' do
      post '/api/v1/authenticate', params: { username: 'tikazel' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to include('error')
    end
  end
end
