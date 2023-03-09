class CreateParticipantCost < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_costs do |t|
      t.references :participant, foreign_key: true
      t.string :item
      t.float :price
    end
  end
end
