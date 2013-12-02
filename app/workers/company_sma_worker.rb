# CompanySMAWorker.perform_async()
class CompanySMAWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  	# Main Entry point for job
	def perform(id)
		sma_days = [50, 100, 200]
		sma_days.each do |sma_day|
			CompanyTradeHistory.where("company_id = #{id} AND sma_" + sma_day.to_s + " IS NULL").each do |company_trade_history|
				sma = CompanyTradeHistory.where(company_id: id, date: (company_trade_history.date - sma_day.days)..(company_trade_history.date)).average(:close)	
			    company_trade_history.update_attributes("sma_" + sma_day.to_s => sma)
			end
		end	
	end
end
