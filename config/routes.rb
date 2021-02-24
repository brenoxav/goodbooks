Rails.application.routes.draw do
  root 'sessions#welcome'

  get  :login,  to: 'sessions#new'
  post :login,  to: 'sessions#create'
  post :logout, to: 'sessions#destroy'

  resources :users,       only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :followings,  only: [:create, :destroy]
  resources :opinions,    only: [:new, :create, :edit, :update, :destroy]
end
