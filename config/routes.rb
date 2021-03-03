Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do 
      get '/dashboard/:username', to: 'users#find_user', as: 'user_detail'
      # get '/user/:id/favorites', to: 'users#user_favorites', as: 'user_favorites'
      resources :users

      post '/create/signup', to: 'users#create' 
      post '/auth/signin', to: 'user_token#create'
     
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
