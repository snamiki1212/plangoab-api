# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  license_key :string           not null
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class User < ApplicationRecord
  has_many :calendars, dependent: :nullify

  # class << self
  #   def find_valid_user(license_key)
  #     User
  #       .where(license_key: license_key)
  #       .first
  #   end
  # end
end
