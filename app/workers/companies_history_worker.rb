# CompaniesHistoryWorker.perform_async()
class CompaniesHistoryWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3
	def perform()
		Company.all.each do |company|
			CompanyHistoryWorker.perform_async(company.id)
		end	
	end
end
