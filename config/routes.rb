Rails.application.routes.draw do

  root "welcome#index"

  get "/login", to: "sessions#create"
  get "/dashboard", to: "users#show"

  resources "users", only: [:new, :create, :edit, :destroy]
end
