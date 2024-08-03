# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  position   :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
FactoryBot.define do
  factory :project do
    title { "MyString" }
    position { 1 }
  end
end
