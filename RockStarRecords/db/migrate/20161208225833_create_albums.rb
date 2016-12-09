class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, foreign_key: true
      t.string :title
      t.string :scene
      t.timestamps null: false
    end
    add_index :albums, :band_id
  end
end
