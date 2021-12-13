Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end

  resources :posts do
    resources :likes
    resources :comments
  end
end
