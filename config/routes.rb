Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :buys
  end
  # root to: 'orders#index'
  
end
