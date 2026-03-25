class CreateBackAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_accounts do |t|
      t.string :title
      t.boolean :hidden, null: false, default: true
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end
