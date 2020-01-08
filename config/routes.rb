Rails.application.routes.draw do
  get 'search', to: 'search#index'
  resources :releases, only: %i[index create]
  root to: 'releases#index'
end
