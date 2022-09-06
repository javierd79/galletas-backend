Rails.application.routes.draw do
  get '/products', to: 'available_products#index'
  get '/products/:id', to: 'available_products#show'
  put '/products/:id', to: 'available_products#update'
  resources :users, only: [:create, :show]
  post '/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  get '/', to: 'application#welcome'
end
