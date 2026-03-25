class CreateGalleries < ActiveRecord::Migration[7.1]
  def change
    create_table :galleries do |t|
      t.string :title
      t.integer :gallery_pictures_count, null: false, default: 0
      t.timestamps
    end
  end
end
