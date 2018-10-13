class PagesController < ApplicationController
  def index
    @meals = Meal.where(available: true)
  end
end
