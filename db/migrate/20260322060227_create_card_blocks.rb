class CreateCardBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :card_blocks do |t|
      t.references :card
      t.integer :position, null: false, default: 0
      t.string :blockable_type, null: false
      t.string :blockable_id, null: false
      t.timestamps
    end
  end
end
