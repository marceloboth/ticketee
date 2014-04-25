Ticketee::Application.routes.draw do
  root 'projects#index'

  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"


  resources :projects do
    resources :tickets
  end

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
      put "permissions", to: "permissions#set",
                         as: "set_permissions"

    end
  end
end
