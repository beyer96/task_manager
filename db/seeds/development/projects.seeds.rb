# frozen_string_literal: true

after "development:users" do
  notify(__FILE__)

  first_user = User.first

  3.times do |index|
    Project.create_or_find_by!(title: "Project n.#{index}") do |project|
      project.description = FFaker::Lorem.paragraph
      project.is_done = FFaker::Boolean.random
      project.user = first_user
    end
  end

  10.times do |index|
    Project.create_or_find_by!(title: "Project n.#{index + 10}") do |project|
      project.description = FFaker::Lorem.paragraph
      project.is_done = FFaker::Boolean.random
      project.user = User.limit(1).order("RANDOM()").first
    end
  end
end
