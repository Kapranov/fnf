class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :role
      t.string :description
      t.belongs_to :product

      t.timestamps null: false
    end
  end
end
