class CreateFansubs < ActiveRecord::Migration
  def change
    create_table :fansubs do |t|
      t.integer :owner_id
      t.string  :name
      t.string  :url

      t.timestamps null: false
    end

    add_index :fansubs, :owner_id
    add_index :fansubs, :name, unique: true
  end
end
