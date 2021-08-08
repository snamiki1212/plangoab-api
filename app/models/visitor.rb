# frozen_string_literal: true

# == Schema Information
#
# Table name: visitors
#
#  id         :bigint           not null, primary key
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Visitor < ApplicationRecord
  has_many :calendar, dependent: :destroy
end
