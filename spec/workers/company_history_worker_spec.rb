require 'spec_helper'

describe CompanyHistoryWorker do
  before(:all) do
	DatabaseCleaner.strategy = :truncation
	DatabaseCleaner.clean
  end  	

  it { should be_processed_in :default }
  it { should be_retryable 3 }

  it "retreives financial information from yahoo" do
	FactoryGirl.create(:company, ticker: "AAPL")
	VCR.use_cassette("yahoo_stock_history/aapl", :match_requests_on => [:host, :path]) do
		expect {
			subject.perform(Company.first.id)
		}.to change(CompanyTradeHistory, :count).by(251)
		CompanyTradeHistory.where(id: Company.first.id, date: "2013-12-02").should exist
	end
  end
end