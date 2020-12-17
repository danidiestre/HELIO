Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: 'pages#dashboard'

  resources :booking_initial_data, only: :create
  resources :booking_dates, only: [:new, :create]
  resources :booking_categories, only: [:new, :create]
  resources :booking_options, only: [:new, :create]
  resources :booking_budgets, only: [:new, :create]

  resources :bookings, only: [:create, :show] do
    resources :booking_checkout, only: [:new, :create]
    resources :reviews, only: [:new, :create]
    member do
      get :loading
    end
  end

  resources :events, only: [:show, :index] do
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
