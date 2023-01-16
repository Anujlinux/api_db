json.extract! api, :id, :name, :api_endpoint, :api_key, :belongs_to, :created_at, :updated_at
json.url api_url(api, format: :json)
