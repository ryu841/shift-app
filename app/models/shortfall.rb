class Shortfall < ApplicationRecord
  belongs_to :shift
  has_many :tickets, dependent: :destroy
end
