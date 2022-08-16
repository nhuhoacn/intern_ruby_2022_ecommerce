class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, presence: true

  before_save :create_path

  scope :newest, ->{order created_at: :desc}

  def create_path
    return if parent_id.blank?

    next_category = Category.find_by id: parent_id
    self.parent_path = [next_category.parent_path, parent_id].join("/")
  end
end
