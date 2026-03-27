class CreateNotices < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.string :title
      t.string :title_color
      t.integer :title_size, default: 18
      t.string :title_align, default: "center"
      t.text :content
      t.string :content_color
      t.integer :content_size, default: 16
      t.string :content_align, default: "center"
      t.timestamps
    end
  end
end
