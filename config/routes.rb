Rails.application.routes.draw do
  namespace :api do
  	get '/contacts' => 'contacts#index'  
    post '/contacts' => 'contacts#create'
    get '/contacts/:id' => 'contacts#show'
    patch '/contacts/:id' => 'contacts#update'
    delete '/contacts/:id' => 'contacts#destroy'

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
end
