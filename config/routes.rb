Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create]
  delete '/logout', to: 'sessions#destroy'
  resources :payments, only: %i[index new create]
  get 'payments/index_no_group', to: 'payments#index_no_group'
  resources :groups, only: %i[index new create show]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
end
