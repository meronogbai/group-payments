Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  resources :sessions, only: %i[new create destroy]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
end
