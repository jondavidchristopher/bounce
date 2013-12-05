require "yahoo_stock"

# CompanyHistoryWorker.perform_async()
class CompanyHistoryWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3
	def perform(id)
		company = Company.find(id)
		history = YahooStock::History.new(:stock_symbol => company.ticker, :start_date => Time.zone.now.to_date - 365.days, :end_date => Time.zone.now.to_date - 2.days)
		stock_history = history.results(:to_hash).output
		stock_history.each do |trade_values|
		    company_trade_history = CompanyTradeHistory.find_or_initialize_by(company_id: company.id, date: trade_values[:date])
	    	company_trade_history.update_attributes(:open => trade_values[:open], 
	    											:high => trade_values[:high],
	    											:low => trade_values[:low],
	    											:close => trade_values[:close], 
	    											:volume => trade_values[:volume], 
	    											:adjusted_close => trade_values[:adj_close])
		end	
		CompanySMAWorker.perform_async(id)
	end
end

# x = CompanyTradeHistory.where(close: 0..10, date: (Time.now.midnight - 3.days)..(Time.now.midnight-1.day)).uniq.pluck(:company_id)
