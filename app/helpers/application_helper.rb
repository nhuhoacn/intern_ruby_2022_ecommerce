module ApplicationHelper
  include Pagy::Frontend

  def load_categories
    @categories = Category.newest
  end
end
