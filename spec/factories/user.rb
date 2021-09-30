# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:license_key) { |n| "license_key_#{n}" }
  end
end
