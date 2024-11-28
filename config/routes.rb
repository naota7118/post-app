Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  root to: "microposts#index"

  get "/search" => "microposts#search"
  resources :microposts
  get '/signup', to: 'users#new'
  resources :users
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
