Rails.application.routes.draw do
  resources :websites, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "websites#index"
end
