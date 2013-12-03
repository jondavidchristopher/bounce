# CompanyHistoryWorker.perform_async()
class CompanyHistoryWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3
	def perform(id)
		require "yahoo_stock"
		company = Company.find(id)
		history = YahooStock::History.new(:stock_symbol => company.ticker, :start_date => Time.zone.now.to_date - 365.days, :end_date => Time.zone.now.to_date - 2.days)
		stock_history = history.results(:to_hash).output
		stock_history.each do |trade_values|
			# date=>"2013-11-11", :open=>"33.57", :high=>"33.99", :low=>"33.25", :close=>"33.82", :volume=>"15830300", :adj_close=>"33.82"
		    company_trade_history = CompanyTradeHistory.find_or_initialize_by_company_id_and_date(company.id, trade_values[:date])
	    	company_trade_history.update_attributes(:open => trade_values[:open], 
	    											:high => trade_values[:high],
	    											:low => trade_values[:low],
	    											:close => trade_values[:close], 
	    											:volume => trade_values[:volume], 
	    											:adjusted_close => trade_values[:adj_close])
		end	
		CompanySMAWorker.perform_async(id)
		# x = CompanyTradeHistory.where(close: 0..10, date: (Time.now.midnight - 3.days)..(Time.now.midnight-1.day)).uniq.pluck(:company_id)
	end
end
