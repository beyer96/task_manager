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
class Task < ApplicationRecord
  validates :title, presence: true
  has_one_attached :attachment
  has_many :task_tags
  has_many :tags, through: :task_tags
  belongs_to :user
  belongs_to :project, counter_cache: true

  scope :for_user, ->(user) { where(user:) }
  scope :is_done, ->(boolean) { where(is_done: boolean) }
end
