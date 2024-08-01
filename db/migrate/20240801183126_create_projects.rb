class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :is_done, null: false, default: false

      t.timestamps
    end
  end
end
