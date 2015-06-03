class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|
      t.string :name
      t.string :description
      t.belongs_to :task

      t.timestamps null: false
    end
  end
end
