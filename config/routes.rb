Rails.application.routes.draw do
  root to: 'pages#index'

  get '/home', to: 'pages#index'
  get '/contact', to: 'pages#contact'
end
