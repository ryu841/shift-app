class Shift < ApplicationRecord
  # belongs_to :admin

  validates :title_date, presence: true
end
