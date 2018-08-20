Rails.application.routes.draw do
  get 'orders', to: "orders#index"

  devise_for :users
  devise_scope :user do
  end
  root to: "pages#index"


  resources :meals do
    collection do
      get 'mymeals', to: "meals#my_meals"
    end
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:index, :edit, :update, :destroy]
  resources :carts, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
