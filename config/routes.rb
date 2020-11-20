Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  resources :articles do
    resources :comments, except: [:show, :index] 
  end

  get '/home', to: 'pages#index'
  get '/contact', to: 'pages#contact'
  post '/get_request_rp', to: 'webhooks#getrequest'
end
