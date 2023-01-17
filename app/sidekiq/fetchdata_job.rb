require 'httparty'
require 'json'
class FetchdataJob
  include Sidekiq::Job

  sidekiq_options retry: false

  def perform(key, endpoint, srctype, tenant_id)

    #check if the run on the api was sooner than interval time
    






    url = URI(endpoint)
    headers = {'Content-type': 'application/json', 'Authorization': "Bearer #{key}"}
    response = HTTParty.get(url, headers)
    p response.body[0..100]
    p "fetch data completed"
    class_name = "#{srctype.capitalize}DataSourceConfig"
    klass = class_name.constantize
    klass.convert_and_add(response, tenant_id)
    #PiiConfig.convert_and_add(response, tenant_id)
  end
end
