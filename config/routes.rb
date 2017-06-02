Rails.application.routes.draw do
  
  root "cards#index"

  resources :users
  resources :sessions
  resources :cards

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  #get "sign_in" => "users#sign_in" 

  get 'oath/oauth'
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

end
