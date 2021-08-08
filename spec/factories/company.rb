# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "company_#{n}" }
    sequence(:license_key) { |n| "license_key_#{n}" }
  end
end
