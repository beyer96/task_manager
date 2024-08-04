# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  position    :integer          not null
#  tasks_count :integer          default(0)
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
  let(:user) { create(:user) }

  describe("Validations") do
    it("does not save without title") do
      project = build(:project, :without_title, user:).save

      expect(project).to eq(false)
    end
  end

  describe("Associations") do
    it("does not save without user") do
      project = build(:project).save

      expect(project).to eq(false)
    end

    it("does save with all needed associations") do
      project = build(:project, user:).save

      expect(project).to eq(true)
    end

    it("destroys associated tasks") do
      project = create(:project, user:)

      expect { create(:task, project:, user:) }.to change(Task, :count).from(0).to(1)
      expect { project.destroy }.to change(Task, :count).from(1).to(0)
    end
  end
end
