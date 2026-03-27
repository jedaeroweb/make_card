class CreateCardPictures < ActiveRecord::Migration[7.1]
  def change
    create_table :card_pictures do |t|
      t.string :picture, null: false
      t.string :alt
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
