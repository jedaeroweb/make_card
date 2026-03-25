class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :title
      t.string :phone
      t.string :address
      t.boolean :hidden, null: false, default: true
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end
