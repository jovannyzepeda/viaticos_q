json.array!(@proyects) do |proyect|
  json.extract! proyect, :id, :zone_id, :name
  json.url proyect_url(proyect, format: :json)
end
