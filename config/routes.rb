Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  resources :hikes, only: [:index, :show]

  # resources :favorites, only: [:show]

  get '/register', to: 'welcome#new'
  post '/register', to: 'welcome#create'

  resources :users, only: [:show]

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  get '/users/:id/discover', to: 'users#discover'

  get '/users/:user_id/hikes/:id', to: 'favorites#show'

  get '/users/:user_id/dashbaord', to: 'favorites#dashboard'
  post '/users/:user_id/hikes/:id', to: 'favorites#create'

  # get '/users/:user_id/dashbaord', to: 'completes#dashboard'
  post '/users/:user_id/hikes/:id/complete', to: 'completes#create'

end
