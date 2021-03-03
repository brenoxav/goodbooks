Rails.application.routes.draw do
  root 'sessions#welcome'

  get     :login,  to: 'sessions#new'
  post    :login,  to: 'sessions#create'
  delete  :logout, to: 'sessions#destroy'

  resources :users,       only: [:index, :show, :new, :create]
  resources :followings,  only: [:create, :destroy]
  resources :opinions,    only: [:index, :create, :destroy]
end
 