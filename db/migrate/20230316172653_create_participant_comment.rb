class CreateParticipantComment < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_comments do |t|
      t.references :participant, foreign_key: true
      t.text :body
    end
  end
end
