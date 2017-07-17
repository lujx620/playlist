class CreateTunes < ActiveRecord::Migration
  def change
    create_table :tunes do |t|
      t.string :artist
      t.string :title
      t.integer :count
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
