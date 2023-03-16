class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_id, :comments
  end
end
