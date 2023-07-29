Rails.application.routes.draw do
  # Devise routes should be placed above other routes to avoid conflicts
  devise_for :users

  # Define your other routes here...

  root 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      post 'likes', to: 'likes#create', on: :member # Nested route for creating a like
    end
  end

  # Your other routes here...
end
