Rails.application.routes.draw do
  #devise_for :users
  root :to => "live_shows#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :api do
    resources :users do
      resources :live_shows
    end
  end
  resources :users do
    resources :live_shows
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
