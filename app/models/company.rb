# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  license_key :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  has_many :user
end
