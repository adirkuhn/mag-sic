json.array!(@moots) do |moot|
  json.extract! moot, :id, :title, :description, :voting_start_at, :voting_ending_at
  json.url moot_url(moot, format: :json)
end
