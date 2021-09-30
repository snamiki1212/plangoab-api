# frozen_string_literal: true

FactoryBot.define do
  factory :resource do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:order) { |n| n }

    story

    transient do
      event_count { 5 }
    end
    trait :with_events do
      after(:create) do |resource, evalutor|
        create_list(:event, evalutor.event_count, resource: resource)
      end
    end
  end
end
