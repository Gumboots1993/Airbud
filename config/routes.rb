Rails.application.routes.draw do
  devise_for :users
  root to: 'buddies#index'
  resources :buddies do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :show, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end
  get 'my_listings', to: 'pages#my_listings'
  get 'my_bookings', to: 'pages#my_bookings'
  patch 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch 'bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
  patch 'bookings/:id/cancel', to: 'bookings#cancel', as: :cancel_booking

end
