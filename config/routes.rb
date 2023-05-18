Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get '/ranking/current', to: 'rankings#index'
      get '/ranking/year/month', to: 'rankings#example'
      # resources :usert, only: [:index, :create]

      # resources :rankings do
      #   member do
      #     get :current
      #   end
      # end
      
    end
  end
end
