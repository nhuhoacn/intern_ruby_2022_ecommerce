class Product < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validate :name, :price, :quantity_in_stock, presence: true
end
