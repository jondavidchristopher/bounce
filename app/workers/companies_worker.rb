# CompaniesWorker.perform_async()
class CompaniesWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3
	def perform()
	    Sidekiq.redis {|c| c.del('stat:processed') }
	    Sidekiq.redis {|c| c.del('stat:failed') }

		require 'net/ftp'
		require 'csv'

		Net::FTP.open('ftp.nasdaqtrader.com') do |ftp|
			ftp.login
			ftp.chdir("SymbolDirectory")
			csv_files = ["nasdaqlisted.txt", "otherlisted.txt"]
			csv_files.each do |file|
				ftp.gettextfile(file, "db/csv/" + file)
				CSV.new(open("db/csv/" + file), :headers => :first_row, :col_sep => "|", :quote_char => "\x00").each do |row|
				    company = Company.find_or_initialize_by_ticker(row[0])
				    company.update_attributes :name => row[1]
				end
			end	 
		end
		CompaniesHistoryWorker.perform_async()
	end
end
