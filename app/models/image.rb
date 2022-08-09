class Image < ApplicationRecord
  belongs_to :product

  validate :image, presence: true
end
