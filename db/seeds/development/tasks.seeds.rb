# frozen_string_literal: true

after "development:projects" do
  notify(__FILE__)

  User.count.times.with_index(1) do |_, user_id|
    User.find(user_id).projects.each do |project|
      3.times.with_index(1) do |_, index|
        Task.create_or_find_by!(id: index) do |task|
          task.title = "Task n.#{index}"
          task.description = FFaker::Lorem.paragraph
          task.is_done = FFaker::Boolean.random
          task.user_id = user_id
          task.project_id = project.id
        end
      end
    end
  end
end
