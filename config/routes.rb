Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :posts do
    collection do
      post 'confirm'
    end
  end
end
