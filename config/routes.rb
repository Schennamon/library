Rails.application.routes.draw do
  root 'pages#index'
  get 'admin_panel'=>'pages#admin_panel'
  get 'categories_panel'=>'pages#categories_panel'
  get 'books_panel'=>'pages#books_panel'
  get 'authors_panel'=>'pages#authors_panel'
  get 'books/remove'=>'books#remove'
  get 'books/pre-edit'=>'books#pre-edit'
  get 'authors/remove'=>'authors#remove'
  get 'authors/pre-edit'=>'authors#pre-edit'
  resources :books, except: [:index, :show]
  resources :categories, only: [:show]
  resources :authors
end
