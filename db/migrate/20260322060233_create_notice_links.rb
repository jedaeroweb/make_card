class CreateNoticeLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :notice_links do |t|
      t.references :notices, null: false
      t.string :picture, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
