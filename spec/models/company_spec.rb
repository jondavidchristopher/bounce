require 'spec_helper'

describe Company do
	it "has a valid factory" do
		FactoryGirl.create(:company).should be_valid
	end
	it "is invalid without a ticker" do 
		FactoryGirl.build(:company, ticker: nil).should_not be_valid
	end
	it "is invalid with dupliacte ticker" do
		FactoryGirl.create(:company, ticker: "DUP")
		FactoryGirl.build(:company, ticker: "DUP").should_not be_valid
	end
end