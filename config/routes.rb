Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  resources :articles do
    resources :comments, except: [:show, :index] 
  end

  post '/get_request_rp', to: 'webhooks#getrequest'
  get '/home', to: 'pages#index'
  get '/contact', to: 'pages#contact'
  get '/all_requests', to: 'webhooks#getallapis'
end
