Rspec.describe 'GET /api/products', type: :request do
  
  describe 'successful request' do
    before do
      get '/api/products'
    end  

    it 'respond with a 200 status' do
      expect(response).to have_http_status 200
    end
  end

end