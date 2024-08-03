# frozen_string_literal: true

after "development:users" do
  notify(__FILE__)

  User.count.times.with_index(1) do |_, user_id|
    3.times.with_index(1) do |_, index|
      Project.find_or_create_by!(user_id:, position: index) do |project|
        project.title = FFaker::Book.title
        project.position = index
        project.user_id = user_id
      end
    end
  end
end
