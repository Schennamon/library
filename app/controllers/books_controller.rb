class BooksController < ApplicationController
  before_action :require_admin, except: [:show]
  before_action :require_rights_to_books, except: [:show]

  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
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
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book #{@book.title} was deleted successfully."
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def add_author
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was edited successfully."
      redirect_to @book
    else
      render 'edit'
    end
  end

  def update_book_authors
    @book = Book.find(params[:book_id])
    @book.authors << Author.find(params[:author_id])

    if @book.save
      flash[:notice] = "Author was added successfully."
      redirect_to @book
    else
      render 'add_author'
    end
  end

  def destroy_book_author
    @book = Book.find(params[:book_id])
    author = @book.authors.find(params[:author_id])

    if @book.authors.delete(author)
      flash[:notice] = "Author #{author.name} was deleted successfully."
      redirect_to @book
    else
      redirect_to @book
    end
  end

  private

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
