class MealsController < ApplicationController
  before_action :check_admin, except: [:index, :index_public]

  def index_public
    #meals inde@x for public. Not logged in
    @meals = Meal.where(available: true)
  end

  def index
    @meals = Meal.where(available: true)
    @user = current_user
    @orders = Order.where(user: current_user)
    @cart = Cart.new
  end

  def my_meals
    #meals index for admin
    @meals = Meal.order(available: :desc)
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new
    @meal = Meal.create(meal_params)
    if @meal.save
      redirect_to meals_path
    else
      render 'new'
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
    if @meal.save
      redirect_to meals_path
    else
      render 'edit'
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :price, :available)
  end
end
