RSpec.describe 'GET /api/products', type: :request do
  let!(:products) { 3.times {create(:product)} }

  describe 'successful request' do
    before do
      get '/api/products'
    end  

    it 'respond with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'responds with correct title' do
      expect(response_json["products"][0]['title']).to eq "ProductTitle"
    end

    it 'responds with correct description' do
      expect(response_json["products"][0]['description']).to eq "Best in town"
    end

    it 'responds with correct price' do
      expect(response_json["products"][0]['price']).to eq 49
    end

  end

end