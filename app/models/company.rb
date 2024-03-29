class Company < ActiveRecord::Base
	validates_presence_of :ticker
	validates_uniqueness_of :ticker

	has_many :company_trade_histories, :dependent => :destroy
end
