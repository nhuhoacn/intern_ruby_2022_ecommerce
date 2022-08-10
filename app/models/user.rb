class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :messages, dependent: :destroy

  VALID_EMAIL_REGEX = Settings.user.valid_email_regex
  USER_ATTRIBUTES = %i(name email phone address password
    password_confirmation).freeze

  validates :name, presence: true, length: {minimum: Settings.user.name_min}

  validates :email, presence: true, length: {in: Settings.user.email_length},
    format: {with: VALID_EMAIL_REGEX}

  validates :phone, presence: true, length: {in: Settings.user.phone_length}

  validates :address, presence: true,
    length: {minimum: Settings.user.adress_min}

  validates :password, presence: true,
    length: {minimum: Settings.user.pass_min}, allow_nil: true

  scope :newest, ->{order created_at: :desc}

  has_secure_password
  before_save :downcase_email

  private
  def downcase_email
    email.downcase!
  end
end
