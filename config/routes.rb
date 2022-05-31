Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root "home#index"
  resources :shipping_companies, only: %i[index new create show] do
    resources :vehicles, only: %i[index new create show]
    resources :prices, only: %i[index new create]
    resources :time_deliveries, only: %i[index new create]
    resources :products, only: %i[index new create show]
  end
  resources :orders do
    get "search", on: :collection
  end
  get "consultar-pedido", to: "orders#search"
end
