class AddCascadeDeleteToTaskTags < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :task_tags, :tags
    remove_foreign_key :task_tags, :tasks
    add_foreign_key :task_tags, :tags, on_delete: :cascade
    add_foreign_key :task_tags, :tasks, on_delete: :cascade
  end
end
