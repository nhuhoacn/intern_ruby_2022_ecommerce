class Product < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validates :name, :price, :quantity_in_stock, presence: true

  scope :by_name, (lambda do |name|
                     where("name LIKE (?)", "%#{name}%") if name.present?
                   end)
  scope :order_by_price, ->(criteria){order(price: criteria)}
  scope :order_by_created_at, ->(param){order(created_at: param)}
  scope :newest, ->{order created_at: :desc}
end
