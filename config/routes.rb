Rails.application.routes.draw do
  #devise_for :users
  root :to => "live_shows#show"
  resources :homes do 
    collection do

      get :g_index

    end
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :api, :defaults => { :format => :json } do
    post "login" => "auth#login"
    post "logout" => "auth#logout"
    
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
