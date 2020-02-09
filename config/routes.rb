Rails.application.routes.draw do
  get '/login'     => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout'    => 'sessions#destroy'
  get '/users'     => 'users#create'
  get '/auth/:provider/callback' => 'sessions#create'

  resources :lists do 
    resources :items
  end

  resources :users, only: [:new, :create]

root 'lists#index'

end
