Rails.application.routes.draw do
  get 'spots/order-by-name' => 'spots#ordered'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :obstacle_ratings
  resources :comments
  resources :obstacles
  resources :spots do
    resources :obstacles
  end

  get 'spots/most-comments' => 'spots#show'

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
