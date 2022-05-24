Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root "home#index"
  resources :shipping_companies, only: [:index, :new, :create, :show] do
    resources :vehicles, only: [:index, :new, :create, :show]
    resources :prices, only: [:index, :new, :create]
  end
end
