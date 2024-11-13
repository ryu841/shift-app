class Admin < ApplicationRecord
  has_many :shifts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
