Rails.application.routes.draw do
  #devise_for :users
  root :to => "live_shows#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :api, :defaults => { :format => :json } do
    resources :users
    resources :live_shows do
      resources :followings
      resources :chats
      resources :questions do
        resources :askings
      end
    end
  end
  resources :users do
    resources :live_shows
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
