class CreateUserGear < ActiveRecord::Migration[5.2]
  def change
    create_table :user_gears do |t|
      t.references :user, foreign_key: true
      t.float :weight
      t.string :name
    end
  end
end
