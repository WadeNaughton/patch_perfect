class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|
      t.string :name
      t.integer :weight
      t.references :complete, foreign_key: true

      t.timestamps
    end
  end
end
