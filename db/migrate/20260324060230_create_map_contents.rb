class CreateMapContents < ActiveRecord::Migration[7.1]
  def change
    create_table :map_contents do |t|
      t.references :map, null: false
      t.text :content, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end
