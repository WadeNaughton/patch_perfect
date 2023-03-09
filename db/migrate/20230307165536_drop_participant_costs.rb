class DropParticipantCosts < ActiveRecord::Migration[5.2]
  def change
    drop_table :participant_costs
  end
end
