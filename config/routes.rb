Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only:[:index, :show]
  resources :products do
    resources :likes, only:[:create,:destroy]
  end
end
