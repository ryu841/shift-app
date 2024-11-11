class User < ApplicationRecord
  # has_many :shifts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, length: { maximum: 10 }, presence: true
  validates :lastname, length: { maximum: 10 }, presence: true
end
