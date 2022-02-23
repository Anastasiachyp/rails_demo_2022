Rails.application.routes.draw do
  namespace :api do
    resources :pings, only: [:index]
    resources :articles, only: %i[index show create]
  end
end
