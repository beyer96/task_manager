# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           not null
#  first_name             :string           not null
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe("Validations") do
    it "saves valid user" do
      user = create(:user).save

      expect(user).to eq(true)
    end

    it "validates presence of first_name" do
      invalid_user = build(:user, :without_first_name).save

      expect(invalid_user).to eq(false)
    end

    it "validates presence of last_name" do
      invalid_user = build(:user, :without_last_name).save

      expect(invalid_user).to eq(false)
    end
  end

  describe("Custom methods") do
    it "#full_name" do
      user = create(:user)

      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
