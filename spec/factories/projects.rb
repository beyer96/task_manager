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
FactoryBot.define do
  factory :project do
    title { "Project" }
    position { 1 }

    trait :without_title do
      title { nil }
    end
  end
end
