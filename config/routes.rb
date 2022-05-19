Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :shipping_companies, only: [:index, :new, :create, :show]
end
