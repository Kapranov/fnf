Rails.application.routes.draw do

  get 'home/index'
  get 'home/minor'
  get 'products/index', as: 'user_root'

  devise_for :users

  resources :users
  resources :products

  root to: 'visitors#index'

end
