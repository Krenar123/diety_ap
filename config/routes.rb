Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  resources :articles

  get '/home', to: 'pages#index'
  get '/contact', to: 'pages#contact'
end
