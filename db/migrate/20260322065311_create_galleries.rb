class CreateGalleries < ActiveRecord::Migration[7.1]
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :title_color
      t.integer :title_size, default: 18
      t.string :title_align, default: "center"
      t.integer :gallery_pictures_count, null: false, default: 0
      t.timestamps
    end
  end
end
