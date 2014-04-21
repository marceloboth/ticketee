Ticketee::Application.routes.draw do
  root 'projects#index'

  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"

  resources :projects do
    resources :tickets
  end

  namespace :admin do
    root :to => "base#index"
    resources :users
  end
end
