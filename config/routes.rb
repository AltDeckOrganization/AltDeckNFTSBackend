Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :collections
      resources :launches
      resources :tokens
      resources :categories
      resources :users
      resources :launchpad_statistics
      post '/auth/login', to: 'authentication#login'
      post '/admin_change_launch_status/:id', to: 'launches#change_launch_status'
      resources :drops
      post '/auth/login', to: 'authentication#login'
      post '/admin_change_launch_status/:id', to: 'launches#change_launch_status'
      post 'admin_change_drops_status/:id', to: 'drops#change_drop_status'
      put '/admin_launchpad_revenue/:id', to: 'launchpad_statistics#launchpad_revenue'
      get '/admin_launch_details', to: 'launches#get_admin_launches_info'
      get '/admin_drop_details', to: 'drops#get_admin_drops_info'
      get '/admin_collection_details', to: 'collections#get_admin_collections_info'
      put 'vote', to: 'tokens#vote_for_token'
    end
  end
end
