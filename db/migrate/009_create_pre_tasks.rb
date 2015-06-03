class CreatePreTasks < ActiveRecord::Migration
  def change
    create_table :pre_tasks do |t|
      t.string :name
      t.string :barcode
      t.text :description
      t.belongs_to :sub_task

      t.timestamps null: false
    end
  end
end
