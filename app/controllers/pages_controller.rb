class PagesController < ApplicationController
  before_action :require_admin, except: [:index]

  def index
    @categories = Category.all
  end

  def admin_panel
  end

  def categories_panel
  end

  def books_panel
  end

  def authors_panel
  end
end
