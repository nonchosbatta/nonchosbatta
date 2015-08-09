class CreateFansubCollaborations < ActiveRecord::Migration
  def change
    create_table :fansub_collaborations do |t|
      t.integer :fansub_id
      t.integer :collaboration_id

      t.timestamps null: false
    end

    add_index :fansub_collaborations, :fansub_id
    add_index :fansub_collaborations, :collaboration_id
  end
end
