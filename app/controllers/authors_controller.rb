class AuthorsController < ApplicationController
  before_action :require_admin
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @authors = Author.paginate(page: params[:page], per_page: 15)
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Author was edited successfully."
      redirect_to @author
    else
      render 'edit'
    end
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
    @author.destroy
    flash[:notice] = "Author #{@author.name} was deleted successfully."
    redirect_to authors_panel_path
  end
  
  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
