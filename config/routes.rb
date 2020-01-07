Rails.application.routes.draw do
  root to: 'search#index'
  get 'search', to: 'search#index'
  resources :releases, only: %i[index create]
end
