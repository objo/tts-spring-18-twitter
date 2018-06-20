Rails.application.routes.draw do

  devise_for :users
  root "welcome#index"

  resources :users

  get "/follow/:id" => "users#follow", as: :follow
  get "/unfollow/:id" => "users#unfollow", as: :unfollow

end
