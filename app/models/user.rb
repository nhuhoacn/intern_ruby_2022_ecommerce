class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :messages, dependent: :destroy
end
