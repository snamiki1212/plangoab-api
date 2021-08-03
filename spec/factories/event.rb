FactoryBot.define do
  factory :event do
    started_at { Date.new }
    ended_at { Date.new }
    title { "event title" }
    description { "description" }
  end
end