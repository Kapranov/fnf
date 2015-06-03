class AddIndexToProducts < ActiveRecord::Migration
  def change
    add_index :products, [:user_id, :created_at, :updated_at]
  end
end
