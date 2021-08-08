# frozen_string_literal: true

# == Schema Information
#
# Table name: calendars
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#  visitor_id :bigint           not null
#
# Indexes
#
#  index_calendars_on_user_id     (user_id)
#  index_calendars_on_visitor_id  (visitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (visitor_id => visitors.id)
#
class Calendar < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :visitor
  has_many :stories, dependent: :destroy
  accepts_nested_attributes_for :stories
end
