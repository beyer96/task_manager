# frozen_string_literal: true

module Support
  def notify(filename)
    puts "Seeding #{File.basename(filename).split(".")[0]}"
  end
end
