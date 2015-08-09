class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :show_id
      t.integer :number
      t.string  :url
      t.integer :translation
      t.integer :editing
      t.integer :checking
      t.integer :timing
      t.integer :typesetting
      t.integer :encoding
      t.integer :qchecking

      t.timestamps null: false
    end

    add_index :episodes, :show_id
    add_index :episodes, :number
  end
end
