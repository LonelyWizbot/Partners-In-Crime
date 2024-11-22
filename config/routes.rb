Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # root to: "pages#dashboard"
  get "dashboard" => "pages#dashboard", as: :dashboard
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :partners do
    resources :reviews, only: %i[index new create destroy]
    resources :bookings, only: %i[new create show] do
      member do
        patch :accept
        patch :decline
      end
    end
  end

  resources :bookings, only: %i[delete]
end
