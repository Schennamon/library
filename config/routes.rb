Rails.application.routes.draw do
  root 'pages#index'
  resources :categories, only: [:show]
  resources :authors, only: [:index, :show]
end
