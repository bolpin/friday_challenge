Rails.application.routes.draw do
  get 'components/index'
  get 'offer_target_players/index/:offer_target_id', to: 'offer_target_players#index', as: :offer_target_players
  resources :offer_targets
  resources :offers
  resources :players

  # root "offer_targets#index"
  root "components#index"
end
