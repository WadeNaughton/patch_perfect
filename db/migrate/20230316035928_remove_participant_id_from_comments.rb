class RemoveParticipantIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :participant, foreign_key: true
  end
end
