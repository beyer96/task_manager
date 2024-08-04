class AddTasksCountToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :tasks_count, :integer, default: 0

    Project.find_each do |project|
      Project.reset_counters(project.id, :tasks)
    end
  end
end
