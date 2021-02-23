Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :followings, only: [:create, :destroy]
  resources :opinions, only: [:new, :create, :edit, :update, :destroy]
end
