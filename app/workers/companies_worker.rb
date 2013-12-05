require 'net/ftp'
require 'csv'	

# CompaniesWorker.perform_async()
class CompaniesWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3, unique: true

	def perform()
		clear_sidekiq_stats
	    load_csv_from_nasdaq(csv_storage_location)
	    dump_csv_to_db(csv_storage_location)
		CompaniesHistoryWorker.perform_async()
	end

  	def csv_storage_location
  		"db/csv/"
  	end

  	def csv_filename_collection
  		["nasdaqlisted.txt", "otherlisted.txt"]
  	end

  	def clear_sidekiq_stats
	    Sidekiq.redis {|c| c.del('stat:processed') }
	    Sidekiq.redis {|c| c.del('stat:failed') }
	end    

  	def load_csv_from_nasdaq(location)
		Net::FTP.open('ftp.nasdaqtrader.com') do |ftp|
			ftp.login
			ftp.chdir("SymbolDirectory")
			csv_filename_collection.each do |file|
				ftp.gettextfile(file, location + file)
			end	 
		end
  	end

	def dump_csv_to_db(location)
		csv_filename_collection.each do |file|
			CSV.new(open(location + file), :headers => :first_row, :col_sep => "|", :quote_char => "\x00").each do |row|
			    company = Company.find_or_initialize_by(ticker: row[0])
			    company.update_attributes :name => row[1]
			end    
		end    
	end

end
