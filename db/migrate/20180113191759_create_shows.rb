class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.datetime :date
      t.references :user, foreign_key: true
      t.references :band, foreign_key: true
      t.references :venue, foreign_key: true
    end
  end
end
