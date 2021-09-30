# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id               :bigint           not null, primary key
#  background_color :string
#  description      :string
#  ended_at         :datetime
#  started_at       :datetime
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  resource_id      :bigint           not null
#
# Indexes
#
#  index_events_on_resource_id  (resource_id)
#
# Foreign Keys
#
#  fk_rails_...  (resource_id => resources.id)
#
class Event < ApplicationRecord
  belongs_to :resource
end
