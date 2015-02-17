Rails.application.routes.draw do
  resources :lists

  devise_for :users
  devise_for :views
  devise_for :items
  get '/about', to: 'pages#about', as: 'about'

  root to: 'pages#index'
end
