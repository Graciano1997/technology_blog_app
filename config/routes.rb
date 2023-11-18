Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  get 'logout', to: "users#logout"
  delete '/delete/post/:id', to: "posts#destroy"
  delete '/delete/comment/:id', to: "comments#destroy"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:index, :new, :create, :destroy]
    resources :likes, only: [:create]
    end
  end
  get "up", to: "rails/health#show", as: :rails_health_check
  
  namespace :api, default: {format: :json} do
    namespace :v1 do
      resources :posts, only: %i[index] do
        resources :comments, only: %i[index create]
      end
    end
  end
end
