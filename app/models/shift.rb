class Shift < ApplicationRecord
  # belongs_to :admin
  # belongs_to :user

  validates :title_date, presence: true
end
