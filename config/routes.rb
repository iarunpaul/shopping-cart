Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'shops#index'
  resources :products
  resources :shops, only: [:index, :show]
  resources :order_items, only: [:create, :update, :destroy]
  resource :card, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
