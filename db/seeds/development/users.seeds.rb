# frozen_string_literal: true

after :default do
  notify(__FILE__)

  DEFAULT_PASSWORD = "12345678"

  User.find_or_create_by!(email: "info@mytaskmanagerapp.com") do |user|
    user.first_name = "John"
    user.last_name = "Doe"
    user.password = DEFAULT_PASSWORD
  end

  10.times do |index|
    User.find_or_create_by!(email: "user#{index}@mytaskmanagerapp.com") do |user|
      user.first_name = FFaker::Name.first_name
      user.last_name = FFaker::Name.last_name
      user.password = DEFAULT_PASSWORD
    end
  end
end
