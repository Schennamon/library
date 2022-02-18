class PagesController < ApplicationController
  before_action :require_admin, except: [:index]
  before_action :require_root_admin, only: [:admins_panel]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 12)
  end

  def admin_panel
  end

  def admins_panel
  end

  def categories_panel
  end

  def books_panel
    @books = Book.all
  end

  def authors_panel
    @authors = Author.all
  end

  private

  def require_root_admin
    if !current_admin.root?
      flash[:alert] = "You don't have enough rights."
      redirect_to admin_panel_path
    end
  end
end
