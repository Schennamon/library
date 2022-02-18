class CategoriesController < ApplicationController
  before_action :require_admin, except: [:show]
  before_action :require_rights_to_categories, except: [:show]

  def show
    @category = Category.find(params[:id])
    @groups = @category.groups
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

  def pre_edit

  end

  def edit
    @category = Category.find(params[:category_id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category was edited successfully."
      redirect_to @category
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_rights_to_categories
    if !current_admin.rights_to_categories? && !current_admin.root?
      flash[:alert] = "You don't have enough rights."
      redirect_to admin_panel_path
    end
  end
end
