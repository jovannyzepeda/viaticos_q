json.array!(@viaticos) do |viatico|
  json.extract! viatico, :id, :user_id, :proyect_id, :cantidad
  json.url viatico_url(viatico, format: :json)
end
