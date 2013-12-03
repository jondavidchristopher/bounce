require 'spec_helper'

describe CompanyTradeHistory do
	it "has a valid factory" do
		company = FactoryGirl.create(:company)
		FactoryGirl.create(:company_trade_history, company_id: company.id).should be_valid
	end
	it "is invalid without a company" do 
		FactoryGirl.build(:company_trade_history, company_id: nil).should_not be_valid
	end
	it "is invalid without a close" do 
		FactoryGirl.build(:company_trade_history, close: nil).should_not be_valid
	end
	it "is invalid with duplicate company_id and date" do
		company = FactoryGirl.create(:company)
		FactoryGirl.create(:company_trade_history, company_id: company.id, date: Time.zone.now.to_date)
		FactoryGirl.build(:company_trade_history, company_id: company.id, date: Time.zone.now.to_date).should_not be_valid
	end
end
