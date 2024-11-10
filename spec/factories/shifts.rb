FactoryBot.define do
  factory :shift do
    title_date { Time.zone.today }
    comment { 'コメント' }

    # association :admin, factory: :admin
  end
end
