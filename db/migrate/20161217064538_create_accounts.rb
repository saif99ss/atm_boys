class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_no
      t.decimal :balance
      t.string :user_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
