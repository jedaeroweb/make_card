class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :user
      t.string :title
      t.datetime :event_time
      #   t.string :address
      t.integer :card_blocks_count, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.datetime :published_at
      t.timestamps
    end
  end
end
