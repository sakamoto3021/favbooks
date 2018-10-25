Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create] do
    member do
      get 'fav_posts'
    end
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :posts do
    collection do
      post 'confirm'
    end
  end
  
  resources :favorites, only: [:create, :destroy] do
    member do
      get :likes
    end
  end
end
