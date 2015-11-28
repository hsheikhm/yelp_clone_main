Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  root to: "restaurants#index"

  resources :restaurants, shallow: true do
    resources :reviews do
      resources :endoresements
    end
  end
end
