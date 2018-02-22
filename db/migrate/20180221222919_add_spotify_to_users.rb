class AddSpotifyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :spotify_token, :string
  end
end
