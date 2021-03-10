Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do 
      get '/dashboard/:username', to: 'users#find_user', as: 'user_detail'
      resources :users do
        member do
          get :confirm_email
        end
      end
      post 'password/forgot', to: 'passwords#forgot'
      post 'password/reset', to: 'passwords#reset'
      
      post '/create/signup', to: 'users#create' 
      post '/auth/signin', to: 'user_token#create'
     
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
