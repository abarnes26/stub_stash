class CreateArtistUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :artist_users do |t|
      t.references :artist, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
