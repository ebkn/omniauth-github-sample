Rails.application.routes.draw do
  get 'home/index'
  get "/auth/:provider/callback" => "sessions#callback"
  get "/signout" => "sessions#destroy"
  resource :user, only: %i[edit update]
  root 'home#index'
end
