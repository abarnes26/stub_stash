Rails.application.routes.draw do

  root "welcome#index"

  get "/login", to: "sessions#create"
  get "/dashboard", to: "users#show"

  resources "users", only: [:new, :create, :edit]
  resources "bands", only: [:index, :new, :create]
  resources "venues", only: [:index, :new, :create]
  resources "shows", only: [:index, :new, :create, :edit, :destroy]
end
