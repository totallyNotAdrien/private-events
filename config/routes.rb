Rails.application.routes.draw do
  resources :event_confirmations
  devise_for :users, controllers: {registrations: "registrations"}
  resources :events
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
