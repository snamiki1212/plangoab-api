# frozen_string_literal: true

# == Schema Information
#
# Table name: resources
#
#  id                 :bigint           not null, primary key
#  event_border_color :string
#  field              :string
#  order              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  story_id           :bigint           not null
#
# Indexes
#
#  index_resources_on_story_id  (story_id)
#
# Foreign Keys
#
#  fk_rails_...  (story_id => stories.id)
#
class Resource < ApplicationRecord
  belongs_to :story
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events
end
