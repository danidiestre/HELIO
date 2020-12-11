Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: 'pages#dashboard'

  resources :booking_initial_data, only: :create
  resources :booking_dates, only: [:new, :create]
  resources :booking_categories, only: [:new, :create]
  resources :booking_options, only: [:new, :create]
  resources :booking_budgets, only: [:new, :create]
  resources :booking_checkout, only: [:new, :create]

  resources :events, only: [:show]
end
