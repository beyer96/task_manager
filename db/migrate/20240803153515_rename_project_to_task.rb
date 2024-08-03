class RenameProjectToTask < ActiveRecord::Migration[7.1]
  def change
    rename_table :projects, :tasks
  end
end
