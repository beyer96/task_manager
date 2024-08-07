class AddUniquenessOfPositionInUserScopeForProjects < ActiveRecord::Migration[7.1]
  def change
    add_index :projects, %i[position user_id], unique: true
  end
end
