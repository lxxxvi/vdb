Rails.application.routes.draw do
  devise_for :users
  get 'search', to: 'search#index', as: :search
  resources :releases, only: %i[index new create]
  root to: 'releases#index'
end
