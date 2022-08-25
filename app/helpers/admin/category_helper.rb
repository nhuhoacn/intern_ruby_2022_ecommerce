module Admin::CategoryHelper
  def find_parent category
    parent = category.category
    parent.nil? ? t("admin.category.none") : parent.name
  end

  def options_for_category category
    options = Category.pluck :name, :id
    options.delete [category.name.to_s, category.id]
    options.unshift ["None", nil]
  end

  def parent_category categories
    output = []
    categories.each do |cate|
      input = [cate.name, cate.id.to_s]
      output.append input
    end
    output
  end
end
