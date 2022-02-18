class AdminsController < ApplicationController
  before_action :require_root_admin

  def remove
  end

  def setup
  end

  def new 
    @admin = Admin.new
  end

  def edit
  end

  def update
    @admin = Admin.find(params[:admin_id])
    if @admin.update(params.permit(:rights_to_books, :rights_to_categories))
      flash[:notice] = "Admin was edited successfully."
      redirect_to admins_panel_path
    else
      render 'edit'
    end
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      flash[:notice] = "Admin was created successfully."
      redirect_to admins_panel_path
    else
      render 'new'
    end
  end

  def destroy
    @admin = Admin.find(params[:admin_id])
    @admin.destroy
    flash[:notice] = "Admin #{@admin.name} was deleted successfully."
    redirect_to admins_panel_path
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :password)
  end

  def require_root_admin
    if !current_admin.root?
      flash[:alert] = "You don't have enough rights."
      redirect_to admins_panel_path
    end
  end

end
