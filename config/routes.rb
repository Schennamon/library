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

  get 'categories/remove'=>'categories#remove'
  delete 'categories/remove'=>'categories#destroy'
  get 'categories/pre_edit'=>'categories#pre_edit'

  get 'groups/remove'=>'groups#remove'

  get 'admins/remove'=>'admins#remove'
  delete 'admins/remove'=>'admins#destroy'
  get 'admins/edit'=>'admins#edit'
  patch 'admin'=>'admins#update'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :groups, except: [:show, :update]
  resources :admins, only: [:new, :create]
  resources :books
  resources :categories, except: [:index]
  resources :authors
end
