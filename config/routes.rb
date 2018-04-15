Rails.application.routes.draw do

  resources :emails, only: [:new, :create]

  root to: "emails#new"
end
