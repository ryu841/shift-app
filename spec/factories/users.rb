FactoryBot.define do
  factory :user do
    firstname { '山田' }
    lastname { '太郎' }
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password { '111111' }
    password_confirmation { '111111' }
  end
end
