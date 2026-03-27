class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :user
      t.string :title, null: false
      t.datetime :event_time, null: false
      t.string :place, null: false
      t.string :zipcode, null: false
      t.string :address, null: false
      t.string :address_detail
      t.integer :card_blocks_count, null: false, default: 0
      t.integer :notices_count, null: false, default: 0
      t.integer :galleries_count, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.datetime :published_at
      t.timestamps
    end
  end
end
