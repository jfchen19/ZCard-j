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

  resources :posts, only:[] do
    resources :comments, shallow: true, only: [:create, :destroy]   # 刪除時並不需要知道post id, 只需要知道comment id
  end

end
