class Shift < ApplicationRecord
  # belongs_to :admin
  # belongs_to :user
  has_many :shortfalls, dependent: :destroy
  accepts_nested_attributes_for :shortfalls, allow_destroy: true

  validates :title_date, presence: true
end
