Rails.application.routes.draw do

  resources :lists do
    resources :items, except: [:index]
  end

  devise_for :users
  
  get '/about', to: 'pages#about', as: 'about'

  root to: 'pages#index'
end
