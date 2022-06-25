Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :buddies do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :show]
  get 'my_listings', to: 'pages#my_listings'
  get 'my_bookings', to: 'pages#my_bookings'
  patch 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch 'bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
end
