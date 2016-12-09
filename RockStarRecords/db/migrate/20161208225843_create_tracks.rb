class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, foreign_key: true
      t.string :title
      t.string :status
      t.timestamps null: false
    end
    add_index :tracks, :album_id
  end
end
