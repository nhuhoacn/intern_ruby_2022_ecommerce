class Message < ApplicationRecord
  belongs_to :user

  validate :message, presence: true,
            length: {maximum: Settings.message.message_max}
end
