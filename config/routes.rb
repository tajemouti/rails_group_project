Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  devise_scope :user do
    authenticated :user do
      root :to => "foods#index", as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated :user do
      root :to => "devise/sessions#new", as: :unauthenticated_root
    end
  end

  resources :users, only: [:index]
  resources :foods, except: [:update]
  resources :public_recipes,except: [:update]
  resources :shopping_lists, except: [:update]

  resources :recipes do
    resources :recipe_foods, only: [:create, :destroy]
  end

  resources :inventories, except: [:update] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end 

  get 'shopping_lists/index'
end
