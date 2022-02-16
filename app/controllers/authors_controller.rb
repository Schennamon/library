class AuthorsController < ApplicationController
  before_action :require_admin, except: [:index, :show]

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
      redirect_to authors_panel_path
    else
      render 'new'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    flash[:notice] = "Author #{@author.name} was deleted successfully."
    redirect_to authors_panel_path
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = "Author was edited successfully."
      redirect_to @author
    else
      render 'edit'
    end
  end
  
  private

  def author_params
    params.require(:author).permit(:name)
  end
end
