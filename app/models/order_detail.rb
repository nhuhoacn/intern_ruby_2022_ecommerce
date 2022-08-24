class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  scope :order_by_ids, ->(ids){where order_id: ids}
  delegate :name, to: :product
end
