Rails.application.routes.draw do
  
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update, :destroy] do
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
    member do
      get 'title_index'
    end
  end
 
  resources :favorites, only: [:create, :destroy] do
    member do
      get :likes
    end
  end
  
  resources :items, only: [:new, :create]
  resources :contacts, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  get 'agreement', to: 'agreements#agreement'
  get 'privacy', to: 'agreements#privacy'
end
