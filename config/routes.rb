Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :images do
    resources :categories
  end
end
