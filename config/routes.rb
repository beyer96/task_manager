Rails.application.routes.draw do
  resources :tags, except: %i[show] do
    collection do
      post :search
    end
  end
  resources :projects do
    collection do
      post :search
    end
  end
  resources :tasks do
    member do
      put :toggle_done
    end
    collection do
      post :search
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
