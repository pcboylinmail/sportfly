Rails.application.routes.draw do
  #devise_for :users
  root :to => "homes#index"
  resources :homes do 
    collection do

      get :g_index

    end
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :api do
    resources :users do
      resources :live_shows
    end
  end
  resources :users do
    resources :live_shows
  end

  get '/g_index' => 'homes#g_index' , :as => 'g_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
