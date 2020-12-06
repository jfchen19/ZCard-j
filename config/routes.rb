Rails.application.routes.draw do

  root "boards#index"

  get '/users/sign_up', to: 'registrations#new'
  post '/users', to: 'registrations#create'

  get '/users/sign_in', to: 'sessions#new'
  post 'sessions',to: 'sessions#create'


  resources :boards

end
