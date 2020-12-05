class OrdersController < ApplicationController
  def index
  end

  def create
    @order = Order.new(order_params)
  end

  # private

  # def order_params
  #   params.permit(:price, :token)
  # end

end
