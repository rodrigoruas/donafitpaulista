class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user: current_user)
    @cart = Cart.new
  end

  def new
    @meal = set_meal
    @order = Order.new
    @payment_methods = ["Cartão de Débito", "Cartão de Crédito", "Dinheiro"]
  end

  def create
    @meal = set_meal
    @order = Order.new(order_params)
    # byebug
    # check_meal_exists(@order, @meal)
    @order.user = current_user
    @order.meal = @meal
    if @order.save
      redirect_to meals_path
    else
      render 'new'
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.save
      redirect_to meals_path
    else
      render 'edit'
    end
  end

  # def check_meal_exists(order, meal1)
  #   if Order.where(meal: meal1)
  #     byebug
  #     order.update(order_params)
  #     if order.save
  #       redirect_to meals_path
  #     else
  #       render 'edit'
  #     end
  #   else
  #     order.user = current_user
  #     order.meal = meal1
  #     if order.save
  #       redirect_to meals_path
  #     else
  #       render 'new'
  #     end
  #   end
  # end

  private
  def order_params
    params.require(:order).permit(:meal_id, :user_id, :quantity, :payment_method, :description, :cart_id)
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end
end
