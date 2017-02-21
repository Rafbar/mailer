class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.datetime :deleted_at
      t.string :name,         limit: 255

      t.timestamps
    end
    add_index :transactions, :deleted_at
    add_index :transactions, :name
  end
end
