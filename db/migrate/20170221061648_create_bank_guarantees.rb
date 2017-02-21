class CreateBankGuarantees < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_guarantees do |t|
      t.datetime :deleted_at
      t.integer :transaction_id

      t.timestamps
    end
    add_index :bank_guarantees, :deleted_at
    add_index :bank_guarantees, :transaction_id
  end
end
