class CreateCardPictures < ActiveRecord::Migration[7.1]
  def change
    create_table :card_pictures do |t|
      t.references :card, null: false
      t.string :picture, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
