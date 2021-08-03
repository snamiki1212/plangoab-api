# == Schema Information
#
# Table name: calendars
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_calendars_on_user_id  (user_id)
#
class Calendar < ApplicationRecord
  belongs_to :user
end
