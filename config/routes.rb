Rails.application.routes.draw do

  root "cards#index"
  
  resources :users
  resources :sessions
  resources :cards

  scope '/registration' do
    get "logout" => "sessions#destroy", :as => "logout"
    get "login" => "sessions#new", :as => "login"
    get "signup" => "users#new", :as => "signup"

    post "oauth/callback" => "oauths#callback"
    get "oauth/callback" => "oauths#callback" # for use with Github
    get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
    delete "oauth/:provider" => "oauths#destroy", :as => :delete_oauth
  end
end
