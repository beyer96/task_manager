# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text
#  is_done     :boolean          default(FALSE), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#  index_tasks_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { create(:user) }

  describe("Validations") do
    it("validates presence of title") do
      task = build(:task, :without_title, user:).save

      expect(task).to eq(false)

      task = build(:task, user:).save
      expect(task).to eq(true)
    end
  end

  describe("Associations") do
    it("does not save task without user") do
      task = build(:task).save

      expect(task).to eq(false)
    end
  end
end
