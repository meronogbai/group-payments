Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, only: %i[new create show]
  resources :groups, only: %i[index new create show]
  resources :payments, only: %i[index new create]
  get 'payments/index_no_group', to: 'payments#index_no_group'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
