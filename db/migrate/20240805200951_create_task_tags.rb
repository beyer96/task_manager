class CreateTaskTags < ActiveRecord::Migration[7.1]
  def change
    create_table :task_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
