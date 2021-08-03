# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  description :string
#  ended_at    :datetime
#  started_at  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
end
