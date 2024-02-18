json.extract! worker, :id, :image, :name, :email, :address, :role, :experience, :phone :latitude, :longitude, :created_at, :updated_at
json.url worker_url(worker, format: :json)
