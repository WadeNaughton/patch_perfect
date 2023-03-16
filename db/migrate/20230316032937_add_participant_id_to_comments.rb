class AddParticipantIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :participant, foreign_key: true
  end
end
