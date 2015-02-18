Rails.application.routes.draw do

  devise_for :users

  resources :lists, except: [:index] do 
    resources :items, only: [:new, :create]
  end

  get '/about', to: 'pages#about', as: 'about'

  root to: 'pages#index'
end
