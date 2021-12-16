Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[index show new create destroy] do
    resources :posts, only: %i[index show new create destroy]
  end

  resources :posts do
    resources :likes
    resources :comments
  end
end
