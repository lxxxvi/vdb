Rails.application.routes.draw do
  devise_for :users

  get 'search', to: 'search#index', as: :search

  get 'library', to: 'library#show', as: :library
  scope :library do
    resources :releases, only: %i[new create destroy]
  end

  get :profile, to: 'profiles#show'
  scope :profile do
    resource :discogs_token, only: %i[edit update]
  end

  root to: redirect('/library')
end
