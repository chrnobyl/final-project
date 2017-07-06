Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :pets
      resources :users
      resources :shelters
      resources :user_pets, except: [:index, :create, :show, :destroy]

      get '/users/:id/user_pets', to: 'user_pets#index'
      post '/users/:id/user_pets', to: 'user_pets#create'
      get '/users/:id/user_pets/:id', to: 'user_pets#show'
      delete '/users/:id/user_pets/:id', to: 'user_pets#destroy'
    end
  end
end
