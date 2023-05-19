Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users, param: :_username
  # post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'
  namespace :api do
    namespace :v1 do
      get '/ranking/current', to: 'rankings#index'
      get '/ranking/year/month', to: 'rankings#ranking_filter'
      post '/ranking/record', to: 'rankings#create_record'

      resources :users, param: :_username
      post '/auth/login', to: 'authentication#login'
      get '/*a', to: 'application#not_found'
    end
  end
end
