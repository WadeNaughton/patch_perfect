Rails.application.routes.draw do
  # get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  resources :hikes, only: [:index, :show]
  get '/search', to: 'hikes#search'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/:id/discover', to: 'users#discover'

  get '/users/:user_id/hikes/:id', to: 'favorites#show'
  post '/users/:user_id/hikes/:id', to: 'favorites#create'

  post '/users/:user_id/hikes/:id/complete', to: 'completes#create'
  get '/users/:user_id/hikes/:id/complete/edit', to: 'completes#edit'
  get '/users/:user_id/hikes/:id/complete', to: 'completes#show'
  patch '/users/:user_id/hikes/:id/complete', to: 'completes#update'

  get '/users/:user_id/hikes/:id/comments', to: 'comment#show'
  get '/users/:user_id/hikes/:id/comment/new', to: 'comment#new'
  post '/users/:user_id/hikes/:id/comment', to: 'comment#create'
  delete '/users/:user_id/hikes/:hike_id/comment/:id', to: 'comment#destroy'


  get '/users/:user_id/hikes/:id/gear', to: 'gear#index'
  get '/users/:user_id/hikes/:id/gear/new', to: 'gear#new'
  post '/users/:user_id/hikes/:id/gear', to: 'gear#create'
  delete '/users/:user_id/hikes/:hike_id/gear/:id', to: 'gear#destroy'


end
