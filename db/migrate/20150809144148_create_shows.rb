class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :fansub_id
      t.integer :collaboration_id
      t.string  :title
      t.string  :short_title
      t.integer :episodes_count
      t.integer :status
      t.integer :format
      t.date    :started_at
      t.date    :ended_at

      t.timestamps null: false
    end

    add_index :shows, :fansub_id
    add_index :shows, :collaboration_id
    add_index :shows, :title
    add_index :shows, :short_title
    add_index :shows, :status
    add_index :shows, :format
    add_index :shows, :started_at
    add_index :shows, :ended_at
  end
end
