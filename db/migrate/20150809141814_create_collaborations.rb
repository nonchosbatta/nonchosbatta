class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.string :name

      t.timestamps null: false
    end

    add_index :collaborations, :name, unique: true
  end
end
