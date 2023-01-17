require 'sidekiq-cron'
class ApiData < ApplicationJob
	queue_as :default

	def perform
		srctypes = Srctype.includes(:apis)

		srctypes.each do |src_type|
			p src_type
			src_type.apis.each do |api|
				p api
				job_id = FetchdataJob.perform_async(api.api_keys, api.api_endpoint, src_type.name, api.user_id)
	    		p job_id
			end
		end
	end
end

Sidekiq::Cron::Job.create(name: 'api-fetch and test', cron: '*/15 * * * * *', class: 'ApiData')


