json.array!(@rullings) do |rulling|
  json.extract! rulling, :id, :title, :objective, :description
  json.url rulling_url(rulling, format: :json)
end
