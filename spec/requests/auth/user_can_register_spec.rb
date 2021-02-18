RSpec.describe 'POST /api/auth', type: :request do
  describe 'successful registration' do
    before do
      post '/api/auth',
      params: {
        email: "user@email.com",
        password: "password",
        password_confirmation: "password"
      }
    end

    it 'respond with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'responds with expected status message' do
      expect(response_json['status']).to eq "success"
    end

    it 'responds with user id' do
      expect(response_json['data']['uid']). to eq "user@email.com"
    end
  end

  describe 'unsuccessful registration' do
    before do
      post '/api/auth',
      params: {
        email: "user@email.com",
        password: "password",
        password_confirmation: "assword"
      }
    end

    it 'responds with a 422 status' do
      expect(response).to have_http_status 422
    end

    it 'response with appropriate error message' do
      expect(response_json['errors']['full_messages'].first).to eq "Password confirmation doesn't match Password"
    end
  end
end