class Shift < ApplicationRecord
  belongs_to :admin
  has_many :tickets
  has_many :tickets_user, through: :tickets, source: :user
  has_many :shortfalls, dependent: :destroy
  accepts_nested_attributes_for :shortfalls, allow_destroy: true, reject_if: :all_blank, limit: 5

  validates :title_date, presence: true
end
