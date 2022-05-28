Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root "home#index"
  resources :shipping_companies, only: [:index, :new, :create, :show] do
    resources :vehicles, only: [:index, :new, :create, :show]
    resources :prices, only: [:index, :new, :create]
    resources :time_deliveries, only: [:index, :new, :create]
    resources :products, only: [:index, :new, :create, :show]
  end
end
