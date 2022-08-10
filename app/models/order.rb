class Order < ApplicationRecord
  enum status: {Pending: 0, Shipping: 1, Delivered: 2, Canceled: 3,
                Rejected: 4}

  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  belongs_to :user

  scope :oldest, ->{order created_at: :asc}

  delegate :name, to: :user
end
