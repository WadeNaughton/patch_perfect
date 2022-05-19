Rails.application.routes.draw do
  # get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  resources :hikes, only: [:index, :show]

  # resources :favorites, only: [:show]

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/:id/discover', to: 'users#discover'

  get '/users/:user_id/hikes/:id', to: 'favorites#show'

  post '/users/:user_id/hikes/:id', to: 'favorites#create'

  # get '/users/:user_id/dashbaord', to: 'completes#dashboard'
  post '/users/:user_id/hikes/:id/complete', to: 'completes#create'

end
