class CreateGalleryContents < ActiveRecord::Migration[7.1]
  def change
    create_table :gallery_contents do |t|
      t.references :gallery, null: false
      t.text :content, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end
