Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :booking_dates, only: [:new, :create]
  resources :booking_categories, only: [:new, :create]
  resources :booking_options, only: [:new, :create]
  resources :booking_budgets, only: [:new, :create]
  resources :booking_checkout, only: [:new, :create]

end
