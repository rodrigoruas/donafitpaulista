class CartsController < ApplicationController

  def new
    @orders = Order.where(user: current_user)
    @cart = Cart.new
  end

  def create
    @cart = Cart.new
    @orders = Order.where(user: current_user)
    @cart = Cart.create(cart_params)
    @orders.each do |order|
      order.cart_id = @cart.id
      order.save
    end
    if @cart.save
      # @orders.each do |order|
      #   order.cart = @cart
      #   order.save
      # end
      redirect_to cart_path(@cart)
    else
      redirect_to meals_path
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:address, :order_ids => [])
  end
end
