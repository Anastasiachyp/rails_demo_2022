Rails.application.routes.draw do
  namespace :api do
    resources :pings, only: [:index]
  end
end
