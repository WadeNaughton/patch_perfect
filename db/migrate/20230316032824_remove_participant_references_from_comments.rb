class RemoveParticipantReferencesFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :participant_references, :string
  end
end
