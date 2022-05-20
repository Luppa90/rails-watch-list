Rails.application.routes.draw do
  root "lists#index"
  resources :movies
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: [:destroy]
end
