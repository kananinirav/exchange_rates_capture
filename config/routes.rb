Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :public do
      namespace :v1 do
        resources :currencies, only: [:index]
      end
    end
    namespace :admin do
      namespace :v1 do
        resources :currencies, only: [:create]
      end
    end
  end
end
