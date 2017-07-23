Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, except: [:index, :destroy] do
    resources :tutor_dates, only: [:create, :destroy]
    resources :pairings, only: [:create]
  end

  namespace :admin do
    resources :topics
    resources :users, except: [:create, :new]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
