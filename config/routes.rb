Rails.application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  #get "sign_in" => "users#sign_in" 

  resources :users
  resources :sessions
  resources :cards
  
  root "cards#index"
end
