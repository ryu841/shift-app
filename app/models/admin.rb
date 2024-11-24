class Admin < ApplicationRecord
  has_many :shifts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z}
  validates :email, format: { with: VALID_EMAIL_REGEX }
  # 管理者は1人だけ作成できるように制限
  validate :only_one_admin, on: :create

  private

  def only_one_admin
    # 管理者が1人以上いれば処理を中止
    return unless Admin.count.positive?

    errors.add(:base, :one_admin_only)
  end
end
