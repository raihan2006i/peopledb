json.extract! person, :id, :name, :email, :profession, :phone, :address, :blood_group, :approved, :created_at, :updated_at
json.url person_url(person, format: :json)