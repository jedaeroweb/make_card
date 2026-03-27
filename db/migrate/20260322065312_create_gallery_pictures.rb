class CreateGalleryPictures < ActiveRecord::Migration[7.1]
  def change
    create_table :gallery_pictures do |t|
      t.references :gallery, null: false
      t.string :picture, null: false
      t.string :alt
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
