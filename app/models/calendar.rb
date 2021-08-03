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
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Calendar < ApplicationRecord
  belongs_to :user
  has_many :story
end
