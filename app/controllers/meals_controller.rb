class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @user = current_user
  end
end
