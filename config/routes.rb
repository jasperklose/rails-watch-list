Rails.application.routes.draw do
  root 'lists#index'
  resources :lists do
    resources :bookmarks, only: [:index, :new, :create]
  end
  resources :bookmarks, only: :destroy
  resources :movies
end
