class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :user
      t.string :title
      t.datetime :event_time
      t.string :address
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :card_contents_count, null: false, default: 0
      t.integer :card_pictures_count, null: false, default: 0
      t.integer :galleries_count, null: false, default: 0
      t.timestamps
    end
  end
end
