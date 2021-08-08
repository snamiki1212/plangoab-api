# frozen_string_literal: true

FactoryBot.define do
  factory :resource do
    sequence(:field) { |n| "field_#{n}" }
    sequence(:order) { |n| n }
    event_border_color { 'red' }

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
