Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :categories
  resources :interests, only:[:create, :destroy]
  resources :follows, only:[:create, :destroy]
  resources :users, only: [:show]

  resources :images do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create, :show]
  end
  resources :comments, only: [:create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create, :show]
  end

  resources :searches, only: [:create]

  delete 'images/:image_id/votes', to: 'votes#destroy'
  delete 'comments/:comment_id/votes', to: 'votes#destroy'

end
