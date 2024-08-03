class AddAssociationsForProjects < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :project
    add_reference :projects, :user
  end
end
