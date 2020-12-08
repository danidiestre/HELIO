Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :booking_dates, only: [:new, :create]
  resources :booking_options, only: [:new, :create]
  resources :booking_budgets, only: [:new, :create]
  resources :booking_users, only: [:new, :create]

end
