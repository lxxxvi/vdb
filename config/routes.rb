Rails.application.routes.draw do
  get 'search', to: 'search#index', as: :search
  resources :releases, only: %i[index create]
  root to: 'releases#index'
end
