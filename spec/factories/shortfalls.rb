FactoryBot.define do
  factory :shortfall do
    start_time { '2024-11-11 09:00:00' }
    end_time {'2024-11-11 15:00:00' }
    require_count { 2 }
    association :shift
  end
end
