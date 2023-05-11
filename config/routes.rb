Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'foods#index', as: :authenticated_root

    resources :foods, only: %i[index new create destroy]
    resources :recipes, only: %i[index show new create destroy] do
      member do
        post 'toggle_public'
        get 'shopping_list'
      end
      resources :foods, only: %i[new create], shallow: true
    end
    resources :recipe_foods, only: %i[create update destroy]
    resources :public_recipes, only: %i[index show]
    resources :general_shopping_list, only: [:index ,:show]
    resources :inventories, only: %i[index new create show destroy] do
      resources :inventory_foods, only: [:new, :create, :destroy]
    end
  end

  get '/recipes/shopping_list', to: 'recipes#shopping_list'

  root 'public_recipes#index'
end
