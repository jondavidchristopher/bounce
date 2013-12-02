namespace :db do
  desc "Erase and fill database"
  task :tickify => :environment do
	require 'csv'

	CSV.foreach("db/csv/sp500.csv") do |row|
	    company = Company.find_or_initialize_by_ticker(row[0])
	    company.save!
	end    
  end
end