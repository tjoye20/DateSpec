Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :admirers
  end

  resources :conversations do
    resources :messages
  end

  resources :sessions, only: [:new, :create, :destroy]

  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  get '/auth/:provider/callback', to: 'sessions#create'

  root "sessions#new"

end
