class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_no
      t.integer :transaction_type
      t.decimal :amount
      t.string :account_id
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
