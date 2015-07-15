json.array!(@spends) do |spend|
  json.extract! spend, :id, :proyect_id, :fecha, :tipo, :importe, :comntarios, :comprobante, :numero_comprobante, :user_id
  json.url spend_url(spend, format: :json)
end
