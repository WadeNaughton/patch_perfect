class CreateHikeComment < ActiveRecord::Migration[5.2]
  def change
    create_table :hike_comments do |t|
      t.references :hike, foreign_key: true
      t.text :body
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
