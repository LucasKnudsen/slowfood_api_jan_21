RSpec.describe 'POST /api/orders', type: :request do
  let!(:user) {create(:user)}
  let!(:auth) {user.create_new_auth_token}
  let(:test_product) {create(:product)}

  describe 'successfull request ' do
    before do
      post '/api/orders',
      params: {
        product_id: test_product.id
      },
      headers: auth

    end  

    it 'respond with a 201 status' do      
      expect(response).to have_http_status 201
    end
  end

end