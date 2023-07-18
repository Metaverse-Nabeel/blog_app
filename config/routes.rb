Rails.application.routes.draw do
  get 'users/posts'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
    get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
    get '/users', to: 'users#index', as: 'users'
    get '/users/:id', to: 'users#show', as: 'user'
  # Defines the root path route ("/")
  # root "articles#index"
end
