Rails.application.routes.draw do

  root "boards#index"

  resource :users, controller: 'registrations', only: [:create, :edit, :update] do
    get '/sign_up', action: 'new'
  end

  resource :users, controller: 'sessions', only: [] do
    get '/sign_in', action: 'new'
    post  '/sign_in', action: 'create'
    delete '/sign_out', action: 'destroy'
  end

  resources :boards do
    resources :posts, shallow: true
  end
  # 上三行 = 下四行
  # resources :boards do
  #   resources :posts, only:[:index, :new, :create]
  # end
  # resources :posts, only: [:show, :edit, :update, :destroy]

end
