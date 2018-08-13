Rails.application.routes.draw do


  get 'meals/index'

  devise_for :users
  devise_scope :user do

  end
  root to: "pages#index"

  resources :meals do
    resources :orders, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
