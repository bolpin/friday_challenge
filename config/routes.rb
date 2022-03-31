Rails.application.routes.draw do

  # get 'device_count/new', to: 'device_count#new', defaults: { format: 'json' }
  # get 'total_payout', to: 'total_payout#index', defaults: { format: 'json' }
  # get 'query_device_count', to: 'components#query_device_count'
  # get 'query_total_payout', to: 'components#query_total_payout'


  get 'device_count', to: 'devices#count'
  get 'show_device_count', to: 'devices#show_count'

  get 'offer_target_players/index/:offer_target_id', to: 'offer_target_players#index', as: :offer_target_players

  resources :offer_targets
  resources :offers
  resources :players
  # resources :devices

  # get 'components/index'
  root "devices#count"
end
