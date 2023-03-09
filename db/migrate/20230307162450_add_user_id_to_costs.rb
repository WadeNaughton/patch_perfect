class AddUserIdToCosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :costs, :user, foreign_key: true
  end
end
