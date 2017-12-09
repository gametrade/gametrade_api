Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root to: 'games#index'
  resources :users, only: [:index, :show, :update]
  resources :categories, only: [:index, :show]
  resources :game_kinds, only: [:index, :show]

  get '/my_games', to: 'games#my_games'
  resources :games
  resources :reservations
end
