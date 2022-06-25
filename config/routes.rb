Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :buddies do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :show, :edit, :update]
  get 'dashboard', to: 'pages#dashboard'
  patch 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch 'bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
end
