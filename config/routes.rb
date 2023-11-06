Rails.application.routes.draw do
  root "users#index"
  # get '/user/:id', to: "users#index"
  resources :users, shallow: true do
    resources :posts
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
