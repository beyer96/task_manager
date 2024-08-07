# frozen_string_literal: true

after "development:tasks" do
  notify(__FILE__)

  User.count.times.with_index(1) do |_, user_id|
    3.times do
      tag_record = Tag.create do |tag|
        tag.user_id = user_id
        tag.title = FFaker::CheesyLingo.word
      end

      user_first_task = Task.where(user_id:).first
      TaskTag.find_or_create_by(tag_id: tag_record.id) do |task_tag|
        task_tag.tag = tag_record
        task_tag.task = user_first_task
      end
    end
  end
end
