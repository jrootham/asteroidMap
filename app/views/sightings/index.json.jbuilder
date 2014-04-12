json.array!(@sightings) do |sighting|
  json.extract! sighting, :id, :date_sighted, :ra, :dec, :magn, :location, :asteroid_id
  json.url sighting_url(sighting, format: :json)
end
