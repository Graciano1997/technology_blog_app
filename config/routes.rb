Rails.application.routes.draw do
  root "users#index"
  # get '/user/:id', to: "users#index"
  resources :users, only [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
