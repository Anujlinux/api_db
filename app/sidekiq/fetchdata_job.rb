require 'httparty'
require 'json'
class FetchdataJob
  include Sidekiq::Job

  sidekiq_options retry: false

  def perform(key, endpoint, srctype, tenant_id)
    url = URI(endpoint)
    headers = {'Content-type': 'application/json', 'Authorization': "Bearer #{key}"}
    response = HTTParty.get(url, headers)
    p response.body[0..100]
    p "fetch data completed"
    table_data = response.map {|row| row.values_at("schema_name", "table_name", "column_name", "pii_type", "amount")}
        p table_data
    validation = ValidateJob.perform_async(srctype, tenant_id, table_data)
  end
end
