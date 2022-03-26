Rails.application.routes.draw do
  resources :players
  # get 'static_pages/home'

  # Defines the root path route ("/")
  root "static_pages#home"
end
