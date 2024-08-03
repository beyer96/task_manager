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
#  user_id     :bigint
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
FactoryBot.define do
  factory :task do
    title { "Task 1" }
    description { "Description" }
    is_done { false }
    attachment { nil }

    trait :without_title do
      title { nil }
    end
  end
end
