Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users
  get "/home/about" => "home#about"
end
