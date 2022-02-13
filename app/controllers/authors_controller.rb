class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end
  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash[:notice] = "Author was created successfully."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @author = Author.find(params[:author_id])
    @author.destroy
    flash[:notice] = "Author #{@author.name} was deleted successfully."
    redirect_to root_path
  end

  def edit

  end

  def update
    @author = Author.find(params[:id])
    if @author.update(params.permit(:name))
      flash[:notice] = "Author was edited successfully."
      redirect_to root_path
    else
      render 'edit'
    end
  end
  private

  def author_params
    params.require(:author).permit(:name)
  end
end
