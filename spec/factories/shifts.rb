FactoryBot.define do
  factory :shift do
    title_date { Date.today }
    comment { 'コメント' }

    # association :admin, factory: :admin
  end
end
