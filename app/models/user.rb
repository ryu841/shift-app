class User < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :shifts, through: :tickets
  has_many :shortfalls, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, length: { maximum: 10 }, presence: true
  validates :lastname, length: { maximum: 10 }, presence: true
  VALID_EMAIL_REGEX = %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z}
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
