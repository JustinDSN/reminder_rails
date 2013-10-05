json.array!(@posts) do |post|
  json.extract! post, :feeling, :functioning, :activity_id, :notes, :created_at, :updated_at
  json.url post_url(post, format: :json)
end
