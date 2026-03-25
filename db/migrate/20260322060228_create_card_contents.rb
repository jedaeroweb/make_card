class CreateCardContents < ActiveRecord::Migration[7.1]
  def change
    create_table :card_contents do |t|
      t.text :content, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end
