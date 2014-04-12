json.array!(@asteroids) do |asteroid|
  json.extract! asteroid, :id, :ref_num, :name
  json.url asteroid_url(asteroid, format: :json)
end
