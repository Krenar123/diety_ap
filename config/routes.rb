Rails.application.routes.draw do
  root to: 'pages#index'

  get '/home', to: 'pages#index'
end
