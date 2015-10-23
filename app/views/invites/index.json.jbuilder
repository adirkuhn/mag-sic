json.array!(@invites) do |invite|
  json.extract! invite, :id, :hash, :active
  json.url invite_url(invite, format: :json)
end
