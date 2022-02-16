class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Group was created successfully."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    category = Category.find(params[:category_id])
    @group = category.groups.find_by(book_id: params[:book_id])
    @group.destroy
    flash[:notice] = "Group was deleted successfully."
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:book_id, :category_id)
  end
end
