module Admin::CategoryHelper
  def find_parent category
    parent = category.category
    parent.nil? ? t("admin.category.none") : parent.name
  end

  def options_for_category categories, category
    options = [["None", nil]]
    categories.each do |cate|
      if cate != category
        input = [cate.name, cate.id.to_s]
        options.append input
      end
    end
    options
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
