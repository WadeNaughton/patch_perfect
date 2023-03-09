class AddCompleteIdToParticipantCosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :participant_costs, :complete, foreign_key: true
  end
end
