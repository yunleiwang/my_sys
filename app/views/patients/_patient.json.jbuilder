json.extract! patient, :id, :file_number, :id_number, :name, :gender, :birthday, :nation, :native_place, :created_at, :updated_at
json.url patient_url(patient, format: :json)