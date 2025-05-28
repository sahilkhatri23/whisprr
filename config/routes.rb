Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "confessions#index"

  resources :confessions, only: [:index, :new, :create] do
    resources :reactions, only: [:create]
  end
end
