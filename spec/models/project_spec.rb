# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  description :text
#  is_done     :boolean          default(FALSE), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }
  let(:user) { create(:user) }

  describe("Validations") do
    it("validates presence of title") do
      project = build(:project, :without_title, user:).save

      expect(project).to eq(false)

      project = build(:project, user:).save
      expect(project).to eq(true)
    end
  end

  describe("Associations") do
    it("does not save project without user") do
      project = build(:project).save

      expect(project).to eq(false)
    end
  end
end
