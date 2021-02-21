class Api::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_confirmed, only: [:update]

  def create
    product = Product.find(params[:product_id])
    order = current_user.orders.create
    order.items.create(product: product)
    if order.persisted?
      render json: {
        message: 'The item was added to your order',
        order: {
          id: order.id,
          items: order.products
        }
      }, status: 201
    else
      render json: {
        message: 'Well, that went wrong..'
      }, status: 422
    end
  end

  def update
    product = Product.find(params[:product_id])
    order = Order.find(params['order_id'])
    order.items.create(product: product)
    if order.persisted?
      render json: {
        message: 'The item was added to your order',
        order: {
          id: order.id,
          items: order.products
        }
      }
    else
      render json: {
        message: 'Well, that went wrong..'
      }, status: 422
    end
  end

  private

  def is_confirmed
    if params['confirmed'] == 'true'
      binding.pry

    end
  end
end
