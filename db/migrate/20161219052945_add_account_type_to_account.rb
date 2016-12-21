class AddAccountTypeToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :account_type, :string
  end
end
