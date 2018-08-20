class CartsController < ApplicationController

  def create
    @cart = Cart.new
    if @cart.save
      redirect_to cart_orders_path(@cart)
    else
      render 'new'
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:address)
  end
end
