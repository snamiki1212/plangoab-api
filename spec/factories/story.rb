FactoryBot.define do
  factory :story do
    sequence(:name) {|n| "name_#{n}"}
    calendar
  end
end