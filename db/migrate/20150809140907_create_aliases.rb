class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.integer :owner_id
      t.string  :name

      t.timestamps null: false
    end

    add_index :aliases, :owner_id
    add_index :aliases, :name, unique: true
  end
end
