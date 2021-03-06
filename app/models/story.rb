# frozen_string_literal: true

# == Schema Information
#
# Table name: stories
#
#  id          :bigint           not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  calendar_id :bigint           not null
#
# Indexes
#
#  index_stories_on_calendar_id  (calendar_id)
#
# Foreign Keys
#
#  fk_rails_...  (calendar_id => calendars.id)
#
class Story < ApplicationRecord
  belongs_to :calendar
  has_many :resources, dependent: :destroy
  accepts_nested_attributes_for :resources
end
