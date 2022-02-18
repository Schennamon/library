class BooksController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_book, only: [:update_book_authors, :destroy_book_author, :show, :edit, :update, :destroy]
  before_action :require_rights_to_books, except: [:index, :show]

  def add_author
  end

  def remove_author
  end

  def update_book_authors
    @book.authors << Author.find(params[:author_id])

    if @book.save
      flash[:notice] = "Author was added successfully."
      redirect_to @book
    else
      render 'add_author'
    end
  end

  def destroy_book_author
    author = @book.authors.find(params[:author_id])

    if @book.authors.delete(author)
      flash[:notice] = "Author #{author.name} was deleted successfully."
      redirect_to @book
    else
      redirect_to @book
    end
  end
  
  def show
  end

  def index
    @books = Book.paginate(page: params[:page], per_page: 15)
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Book was edited successfully."
      redirect_to @book
    else
      render 'edit'
    end
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "Book was created successfully."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book #{@book.title} was deleted successfully."
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :cover)
  end

  def require_rights_to_books
    if !current_admin.rights_to_books? && !current_admin.root?
      flash[:alert] = "You don't have enough rights."
      redirect_to admin_panel_path
    end
  end
end
