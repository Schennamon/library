Rails.application.routes.draw do
  root 'pages#index'

  get 'admin_panel'=>'pages#admin_panel'
  get 'categories_panel'=>'pages#categories_panel'
  get 'books_panel'=>'pages#books_panel'
  get 'authors_panel'=>'pages#authors_panel'
  get 'admins_panel'=>'pages#admins_panel'

  get 'books/add_author'=>'books#add_author'
  get 'books/remove_author'=>'books#remove_author'
  post 'books/update_book_authors'=>'books#update_book_authors'
  post 'books/destroy_book_author'=>'books#destroy_book_author'

  get 'authors/remove'=>'authors#remove'
  get 'authors/pre-edit'=>'authors#pre-edit'

  get 'categories/remove'=>'categories#remove'
  get 'categories/pre-edit'=>'categories#pre-edit'

  get 'groups/remove'=>'groups#remove'

  get 'admins/remove'=>'admins#remove'
  get 'admins/edit'=>'admins#edit'
  patch 'admin'=>'admins#update'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :groups
  resources :admins, except: [:edit, :update]
  resources :books
  resources :categories
  resources :authors
end
