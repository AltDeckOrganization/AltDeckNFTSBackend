Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :collections
      resources :launches
      resources :users
      post '/auth/login', to: 'authentication#login'
      get '/admin_launch_details', to: 'launches#get_admin_launches_info'
      get '/admin_collection_details', to: 'launches#get_admin_collections_info'
    end
  end
end
