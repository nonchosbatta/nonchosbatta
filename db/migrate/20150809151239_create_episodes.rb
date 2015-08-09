class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :show_id
      t.integer :number
      t.string  :url
      t.integer :translation, default: 0
      t.integer :editing,     default: 0
      t.integer :checking,    default: 0
      t.integer :timing,      default: 0
      t.integer :typesetting, default: 0
      t.integer :encoding,    default: 0
      t.integer :qchecking,   default: 0

      t.timestamps null: false
    end

    add_index :episodes, :show_id
    add_index :episodes, :number
  end
end
