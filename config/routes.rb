Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  get '/about', to: 'pages#about', as: 'about'

  root to: 'pages#index'
end
