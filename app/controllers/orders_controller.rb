class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user: current_user)
    @cart = Cart.new
  end

  def new
    @meal = Meal.find(params[:meal_id])
    @order = Order.new
    @payment_methods = ["Cartão de Débito", "Cartão de Crédito", "Dinheiro"]
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.meal = @meal
    # @cart = Cart.new
    # @cart.save
    # @order.cart = @cart

    if @order.save
      redirect_to meals_path
    else
      render 'new'
    end
  end

  private
  def order_params
    params.require(:order).permit(:meal_id, :user_id, :quantity, :payment_method, :description, :cart_id)
  end
end
