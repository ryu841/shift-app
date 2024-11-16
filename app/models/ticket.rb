class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :shift
  belongs_to :shortfall

  validates :comment, length: { maximum: 50 }, allow_blank: true
end
