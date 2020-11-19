Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :payments, only: %i[index new create]
  resources :groups, only: %i[index new create]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
end
