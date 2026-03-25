class CreateMaps < ActiveRecord::Migration[7.1]
  def change
    create_table :maps do |t|
      t.string :title
      t.integer :height
      t.integer :level
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.boolean :hidden, null: false, default: true
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end
