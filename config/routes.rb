Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  resources :hikes, only: [:index, :show]

  resources :favorites, only: [:show]

  get '/register', to: 'welcome#register'
  post '/register', to: 'welcome#create'

  resources :users, only: [:show]

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
end
