Rails.application.routes.draw do

  devise_for :users

  resources :lists, except: [:index] do
    resources :items, except: [:index]
  end

  get '/mylist', to: 'lists#mylist', as: 'mylist'

  get '/about', to: 'pages#about', as: 'about'

  root to: 'pages#index'
end
