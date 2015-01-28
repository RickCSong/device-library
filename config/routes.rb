Rails.application.routes.draw do

  root 'static#index'

  resources :users, only: [:index, :show]
  resources :categories, only: [:index, :show, :create, :update, :destroy]

  # This needs to be at the bottom.
  match '/*path' => 'static#index', via: [:get, :post, :put, :patch, :delete]
end
