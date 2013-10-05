json.array!(@posts) do |post|
  json.extract! post, :feeling, :functioning
  json.url post_url(post, format: :json)
end
