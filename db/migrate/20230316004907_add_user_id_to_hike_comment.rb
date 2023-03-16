class AddUserIdToHikeComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :hike_comments, :user, foreign_key: true
  end
end
