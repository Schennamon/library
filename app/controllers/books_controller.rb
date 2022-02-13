class BooksController < ApplicationController
  
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
    @book = Book.find(params[:book_id])
    @book.destroy
    flash[:notice] = "Book #{@book.title} was deleted successfully."
    redirect_to root_path
  end

  def edit
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.permit(:title, :author_id))
      flash[:notice] = "Book was edited successfully."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id)
  end
end
