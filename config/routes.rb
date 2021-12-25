Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: %i[index show new create destroy] do
    resources :posts, only: %i[index show new create destroy]
  end

  resources :posts do
    resources :likes
    resources :comments
  end

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:index] do
      resources :comments, only: %i[create index]
    end
  end
end
