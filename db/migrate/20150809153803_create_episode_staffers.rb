class CreateEpisodeStaffers < ActiveRecord::Migration
  def change
    create_table :episode_staffers do |t|
      t.integer :staffer_id
      t.integer :alias_id
      t.integer :episode_id
      t.integer :role, default: 0

      t.timestamps null: false
    end

    add_index :episode_staffers, :staffer_id
    add_index :episode_staffers, :episode_id
    add_index :episode_staffers, :alias_id
    add_index :episode_staffers, :role
  end
end
