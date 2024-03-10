Rails.application.routes.draw do
  resource :inbox, :controller => 'inbox', :only => [:show,:create]
  resources :repairmen
  devise_for :admin
  devise_for :users
  root 'repairmen#index'
  get 'pages/users'
  get "/admin", to: 'pages#admin'
  post "/register_repairman", to: "admin#register_repairman"
  get 'pages/repairmen'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
