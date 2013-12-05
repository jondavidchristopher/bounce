require 'spec_helper'

describe CompanySMAWorker do
  before(:all) do
	DatabaseCleaner.strategy = :truncation
	DatabaseCleaner.clean
  end  	

  it { should be_processed_in :default }
  it { should be_retryable 3 }

  it "calculates SMA averages for a stock" do
	company = FactoryGirl.create(:company)
	FactoryGirl.create(:company_trade_history, company_id: company.id, sma_50: nil, sma_100: nil, sma_200: nil)
	subject.perform(Company.first.id)
	company_trade_history = CompanyTradeHistory.find(CompanyTradeHistory.first.id)
	company_trade_history.sma_50.should_not be_nil
	company_trade_history.sma_100.should_not be_nil
	company_trade_history.sma_200.should_not be_nil
  end
end