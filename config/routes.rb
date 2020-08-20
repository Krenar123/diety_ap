Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  resources :articles do 
    resources :comments, except: :show 
  end

  get '/home', to: 'pages#index'
  get '/contact', to: 'pages#contact'
end
