Rails.application.routes.draw do
  root 'shops#index'
  resources :products
  resources :shops, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
