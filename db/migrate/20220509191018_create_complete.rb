class CreateComplete < ActiveRecord::Migration[5.2]
  def change
    create_table :completes do |t|
      t.references :user, foreign_key: true
      t.references :hike, foreign_key: true
    end
  end
end
