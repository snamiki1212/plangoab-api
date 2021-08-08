# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_users_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class User < ApplicationRecord
  has_many :calendar, dependent: :nullify
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
