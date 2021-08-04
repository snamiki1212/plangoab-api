FactoryBot.define do
  factory :story do
    sequence(:name) {|n| "name_#{n}"}
    calendar

    transient do
      resource_count { 5 }
    end
    trait :with_resources do
      after(:create) do |story, evalutor|
        create_list(:resource, evalutor.resource_count, :with_events, story: story)
      end
    end
  end
end