class PagesController < ApplicationController
  before_action :require_admin, except: [:index]
  before_action :require_root_admin, only: [:admins_panel]

  def index
    @categories = Category.all
  end

  def admin_panel
  end

  def admins_panel
  end

  def categories_panel
  end

  def books_panel
  end

  def authors_panel
  end

  private

  def require_root_admin
    if !current_admin.root?
      flash[:alert] = "You don't have enough rights."
      redirect_to admin_panel_path
    end
  end
end
