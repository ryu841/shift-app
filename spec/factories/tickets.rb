FactoryBot.define do
  factory :ticket do
    user { nil }
    shift { nil }
    comment { 'MyText' }
    status { 'MyString' }
  end
end
