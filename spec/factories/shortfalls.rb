FactoryBot.define do
  factory :shortfall do
    start_time { '09:00' }
    end_time { '15:00' }
    require_count { 2 }
    association :shift
  end
end
