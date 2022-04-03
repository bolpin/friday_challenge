Rails.application.routes.draw do
  get 'device_count', to: 'device_count#index', defaults: { format: 'json' }
  get 'total_payout', to: 'total_payout#index', defaults: { format: 'json' }

  get 'offer_target_players/index/:offer_target_id', to: 'offer_target_players#index', as: :offer_target_players

  get 'components/index'

  resources :offer_targets
  resources :offers
  resources :players
  resources :devices

  namespace :api do
    namespace :v1 do
     resources :players, only: [:index, :create, :destroy, :update]
     # resources :devices, only: [:index, :create, :destroy, :update, :count]
     # resources :offers, only: [:index, :create, :destroy, :update]
     # resources :offer_targets, only: [:index, :create, :destroy, :update, :total_payout, :players]
    end
  end

  root "components#index"
end
