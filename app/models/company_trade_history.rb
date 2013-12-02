class CompanyTradeHistory < ActiveRecord::Base
	validates :company, presence: true
	belongs_to :company
end
