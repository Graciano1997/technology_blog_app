Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  get 'logout', to: "users#logout"
  delete '/delete/post/:id', to: "posts#destroy"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
    end
  end
  get "up", to: "rails/health#show", as: :rails_health_check
end
