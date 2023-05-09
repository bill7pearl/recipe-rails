Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'foods#index', as: :authenticated_root

    resources :foods, only: [:index, :new, :create]
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      member do
        post 'toggle_public'
      end
    end
    resources :inventories, only: [:index, :show, :new, :create, :destroy] do
      resources :inventory_foods, only: [:create, :update, :destroy]
    end
    resources :recipe_foods, only: [:create, :update, :destroy]
    resources :public_recipes, only: [:index, :show]
    resources :shopping_lists, only: [:index]
  end

  root 'public_recipes#index'
end
