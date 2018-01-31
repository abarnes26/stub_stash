class CreateBandUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :band_users do |t|
      t.references :band, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
