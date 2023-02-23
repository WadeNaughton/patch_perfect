class DropHikeComment < ActiveRecord::Migration[5.2]
  def change
    drop_table :hike_comments
  end
end
