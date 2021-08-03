FactoryBot.define do
  factory :resource do
    sequence(:field) {|n| "field_#{n}"}
    sequence(:order) {|n| n}
    event_border_color { 'red' }
  end
end