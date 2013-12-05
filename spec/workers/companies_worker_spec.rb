require 'spec_helper'

describe CompaniesWorker do
  before(:all) do
	DatabaseCleaner.strategy = :truncation
	DatabaseCleaner.clean
  end  	

  it { should be_processed_in :default }
  it { should be_retryable 3 }
  it { should be_unique }

  it "loads stocks from a csv into the db" do
	subject.dump_csv_to_db("spec/vcr/csv/")
	Company.where(ticker: "AAPL").should exist
	Company.where(name: "Twitter, Inc. Common Stock").should exist
  end
end