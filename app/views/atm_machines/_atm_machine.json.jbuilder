json.extract! atm_machine, :id, :address, :latitude, :longitude, :name, :street, :city, :created_at, :updated_at
json.url atm_machine_url(atm_machine, format: :json)