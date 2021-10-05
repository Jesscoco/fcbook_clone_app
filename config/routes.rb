Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end
  get 'feeds/index'
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
 
end
