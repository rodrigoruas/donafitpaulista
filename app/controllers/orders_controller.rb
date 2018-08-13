class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

  private
  def order_params
    params.require(:order).permit(:meal_id, :user_id)
  end
end
