json.array!(@galeries) do |galery|
  json.extract! galery, :id, :date_taken, :asteroid_id
  json.url galery_url(galery, format: :json)
end
