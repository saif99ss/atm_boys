class CreateAtmMachines < ActiveRecord::Migration
  def change
    create_table :atm_machines do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :street
      t.string :city

      t.timestamps null: false
    end
  end
end
