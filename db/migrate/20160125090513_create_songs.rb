class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :album
      t.datetime :last_played_at
      t.integer :duration
      t.string :artwork
      t.string :external_id

      t.timestamps
    end
  end
end
