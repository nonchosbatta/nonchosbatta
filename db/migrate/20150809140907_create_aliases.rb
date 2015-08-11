class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.references :subject, polymorphic: true, index: true
      t.string     :name

      t.timestamps null: false
    end

    add_index :aliases, :name, unique: true
  end
end
