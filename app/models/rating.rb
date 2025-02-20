class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :star, presence: true,
            length: {maximum: Settings.review.rating_max,
                     minimum: Settings.review.rating_min}

  validates :comment, presence: true,
            length: {maximum: Settings.message.message_max}
end
