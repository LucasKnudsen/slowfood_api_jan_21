class Api::ProductsController < ApplicationController
  def index
    all_products = Product.all
    render json: { products: all_products }
  end
end
