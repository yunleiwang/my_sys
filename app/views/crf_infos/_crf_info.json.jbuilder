json.extract! crf_info, :id, :name, :description, :seq, :crf_type, :follow, :created_at, :updated_at
json.url crf_info_url(crf_info, format: :json)