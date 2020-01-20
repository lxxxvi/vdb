Rails.application.routes.draw do
  devise_for :users

  get 'search', to: 'search#index', as: :search
  resources :releases, only: %i[index new create]

  get :profile, to: 'profiles#show'
  scope :profile do
    resource :discogs_token, only: %i[edit update]
  end

  root to: 'releases#index'
end
