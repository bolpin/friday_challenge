Rails.application.routes.draw do
  get 'offer_target_players/index/:offer_target_id', to: 'offer_target_players#index', as: :offer_target_players
  resources :offer_targets
  resources :offers
  resources :players
  # get 'static_pages/home'

  # Defines the root path route ("/")
  root "static_pages#home"
end
