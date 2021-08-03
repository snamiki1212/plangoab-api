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
#
class Resource < ApplicationRecord
end
