Rails.application.routes.draw do

  root "welcome#index"

  get "/login", to: "sessions#create"
  get "/dashboard", to: "users#show"
  get "/auth/spotify/callback", to: "spotify#create"

  resources "users", only: [:new, :create, :edit]
  resources "bands", only: [:index, :new, :create]
  resources "shows", only: [:index]
  resources "venues", only: [:index, :new, :create]

  namespace :user do
    resources "shows", only: [:index, :new, :create, :edit, :destroy]
    resources "bands", only: [:index, :destroy]
  end
end
