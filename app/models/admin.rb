class Admin < ApplicationRecord
  has_many :shifts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 管理者は1人だけ作成できるように制限
  validate :only_one_admin, on: :create

  private
  
  def only_one_admin
    if Admin.count > 0
      errors.add(:base, '管理者は1人のみ作成できます。')
    end
  end
end
