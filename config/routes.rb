Rails.application.routes.draw do
  namespace :api do
    resources :pings, only: [:index]
    get :articles, controller: :articles, action: :index
  end
end
