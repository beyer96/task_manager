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

  root "projects#index"
end
