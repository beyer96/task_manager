# frozen_string_literal: true

after "development:users" do
  notify(__FILE__)

  first_user = User.first

  3.times do |index|
    Task.create_or_find_by!(title: "Task n.#{index}") do |task|
      task.description = FFaker::Lorem.paragraph
      task.is_done = FFaker::Boolean.random
      task.user = first_user
    end
  end

  10.times do |index|
    Task.create_or_find_by!(title: "Task n.#{index + 10}") do |task|
      task.description = FFaker::Lorem.paragraph
      task.is_done = FFaker::Boolean.random
      task.user = User.limit(1).order("RANDOM()").first
    end
  end
end
