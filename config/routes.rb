Rails.application.routes.draw do
  get 'password_resets/new'
  # get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/users/:id/discover', to: 'hikes#index'
  get '/users/:user_id/hikes/:id', to: 'hikes#show'
  get '/search', to: 'hikes#search'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'


  resources :password_resets

  resources :users, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/users/:user_id/hikes/:id', to: 'favorites#create'
  delete '/users/:user_id/hikes/:id', to: 'favorites#destroy'

  get '/users/:id/gear/new', to:  'user_gears#new'
  post '/users/:id/gear', to: 'user_gears#create'
  delete '/users/:user_id/gear/:id', to: 'user_gears#destroy'


  post '/users/:user_id/hikes/:id/complete', to: 'completes#create'
  get '/users/:user_id/hikes/:id/complete/edit', to: 'completes#edit'
  get '/users/:user_id/hikes/:id/complete', to: 'completes#show'
  patch '/users/:user_id/hikes/:id/complete', to: 'completes#update'

  get '/users/:user_id/hikes/:id/comments', to: 'comment#show'
  get '/users/:user_id/hikes/:id/comment/new', to: 'comment#new'
  post '/users/:user_id/hikes/:id/comment', to: 'comment#create'
  delete '/users/:user_id/hikes/:hike_id/comment/:id', to: 'comment#destroy'

  get '/users/:user_id/hikes/:id/hike_comment', to: 'hike_comments#show'
  get '/users/:user_id/hikes/:id/hike_comment/new', to: 'hike_comments#new'
  post '/users/:user_id/hikes/:id/hike_comment', to: 'hike_comments#create'
  delete '/users/:user_id/hikes/:hike_id/hike_comment/:id', to: 'hike_comments#destroy'


  get '/users/:user_id/hikes/:id/gear', to: 'complete_gears#index'
  get '/users/:user_id/hikes/:id/gear/new', to: 'complete_gears#new'
  post '/users/:user_id/hikes/:id/gear', to: 'complete_gears#create'
  delete '/users/:user_id/hikes/:hike_id/gear/:id', to: 'complete_gears#destroy'

  get '/users/:user_id/hikes/:id/participants/new', to: 'participants#new'
  post '/users/:user_id/hikes/:id/participants', to: 'participants#create'
  delete '/users/:user_id/hikes/:hike_id/participants/:id', to: 'participants#destroy'


  get '/users/:user_id/hikes/:id/cost/new', to: 'costs#new'
  get '/users/:user_id/hikes/:id/cost', to: 'costs#show'
  post '/users/:user_id/hikes/:id/cost', to: 'costs#create'

  get '/users/:user_id/hikes/:id/participant/:participant_id/guest_cost/new', to: 'guest_costs#new'
  get '/users/:user_id/hikes/:id/participant/:participant_id/guest_costs', to: 'guest_costs#show'
  post '/users/:user_id/hikes/:id/participant/:participant_id/guest_cost', to: 'guest_costs#create'



end
