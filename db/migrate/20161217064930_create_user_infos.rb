class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :user_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
