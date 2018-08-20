Rails.application.routes.draw do

  get 'menu', to: "meals#index_public"

  get 'orders', to: "orders#index"

  devise_for :users
  devise_scope :user do

  end
  root to: "pages#index"

  resources :carts do
    resources :meals do
      collection do
        get 'mymeals', to: "meals#my_meals"
      end
    end
    resources :orders, only: [:index, :new, :create]
  end
end
