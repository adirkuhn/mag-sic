json.array!(@plans) do |plan|
  json.extract! plan, :id, :title, :description, :max_moot_per_year
  json.url plan_url(plan, format: :json)
end
