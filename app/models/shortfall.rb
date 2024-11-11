class Shortfall < ApplicationRecord
  belongs_to :shift

  validates :start_time, :end_time, :require_count, presence: true
end
