Rails.application.routes.draw do
  root 'pages#index'
  get 'admin_panel'=>'pages#admin_panel'
  get 'categories_panel'=>'pages#categories_panel'
  get 'books_panel'=>'pages#books_panel'
  get 'authors_panel'=>'pages#authors_panel'
  resources :books, except: [:index, :show]
  resources :categories, only: [:show]
  resources :authors, only: [:index, :show]
end
