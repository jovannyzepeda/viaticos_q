json.array!(@brokers) do |broker|
  json.extract! broker, :id, :user_id, :proyect_id
  json.url broker_url(broker, format: :json)
end
