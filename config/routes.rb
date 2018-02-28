Rails.application.routes.draw do

  root "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/sign-up", to: "user#new"
  get "/dashboard", to: "users#show"
  get "/auth/spotify/callback", to: "spotify#update"
  get "/spotify-import", to: "spotify#import", as: :spotify_import
  get "/jambase/find-by-name", to: "jambase#find_venue_by_name"
  get "/jambase/find-by-zipcode", to: "jambase#find_venue_by_zipcode"
  post "/jambase/venue-create", to: "jambase#create_venue"

  resources "users", only: [:new, :create, :edit]
  resources "artists", only: [:index, :show, :new, :create]
  resources "shows", only: [:index]
  resources "venues", only: [:index, :show, :new, :create]

  namespace :user do
    resources "shows", only: [:index, :new, :create, :edit, :destroy]
    resources "artists", only: [:index, :destroy]
  end
end
