Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products, except: :destroy
end
