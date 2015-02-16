Rails.application.routes.draw do
  get '/about', to: 'pages#about', as: 'about'

  root to: 'pages#index'
end
