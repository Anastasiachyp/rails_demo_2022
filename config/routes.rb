Rails.application.routes.draw do
  namespace :api do
    # resources :pings, only: [:index]
    get 'api/pings', controller: :pings, action: :index
  end
end
