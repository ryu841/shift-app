FactoryBot.define do
  factory :admin do
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password { '111111' }
  end
end
