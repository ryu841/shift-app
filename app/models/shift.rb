class Shift < ApplicationRecord
  before_save :archive_old_shifts

  belongs_to :admin
  has_many :tickets, dependent: :destroy
  has_many :tickets_user, through: :tickets, source: :user
  has_many :shortfalls, dependent: :destroy
  accepts_nested_attributes_for :shortfalls, allow_destroy: true, reject_if: :all_blank, limit: 5

  validates :title_date, presence: true

  private

  def archive_old_shifts
    return unless title_date.present? && title_date <= 7.days.ago.to_date

    self.archived = true
  end
end
