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
require 'rails_helper'

describe User, type: :model do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:license_key) { user.company.license_key }

  it 'can find valid user.' do
    expect(User.find_valid_user(user_id, license_key)).to eq user
  end

  it 'cannot find valid user by wrong licence key.' do
    expect(User.find_valid_user(user_id, 'this is wrong license key')).not_to eq user
  end
end
