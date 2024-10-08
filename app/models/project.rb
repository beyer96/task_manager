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
#  index_projects_on_position_and_user_id  (position,user_id) UNIQUE
#  index_projects_on_user_id               (user_id)
#
class Project < ApplicationRecord
  validates :title, :position, presence: true
  validates :position, uniqueness: { scope: :user_id }
  has_many :tasks, dependent: :destroy
  belongs_to :user

  scope :for_user, ->(user) { where(user:) }
end
