class CategoriesController < ApplicationController
  def show
    category = Category.find(params[:id])
    @groups = category.groups
  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was created successfully."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @category.destroy
    flash[:notice] = "Category #{@category.name} was deleted successfully."
    redirect_to root_path
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params.permit(:name))
      flash[:notice] = "Category was edited successfully."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
