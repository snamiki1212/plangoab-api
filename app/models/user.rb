# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  licen_key  :string           not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :calendars, dependent: :nullify
  belongs_to :company

  class << self
    def find_valid_user(user_id, license_key)
      User
        .includes(:company)
        .where(id: user_id)
        .where(company: { license_key: license_key })
        .first
    end
  end
end
