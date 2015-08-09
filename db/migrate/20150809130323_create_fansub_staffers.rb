class CreateFansubStaffers < ActiveRecord::Migration
  def change
    create_table :fansub_staffers do |t|
      t.integer :staffer_id
      t.string  :fansub_id
      t.integer :role

      t.timestamps null: false
    end

    add_index :fansub_staffers, :staffer_id
    add_index :fansub_staffers, :fansub_id
    add_index :fansub_staffers, :role
  end
end
