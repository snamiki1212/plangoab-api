FactoryBot.define do
  factory :calendar do
    user

    transient do
      story_count { 5 }
    end
    trait :with_stories do
      after(:create) do |calendar, evalutor|
        create_list(:story, evalutor.story_count, :with_resources, calendar: calendar)
      end
    end
  end
end