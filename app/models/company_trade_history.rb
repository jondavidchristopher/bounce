class CompanyTradeHistory < ActiveRecord::Base
	validates :company, presence: true
	validates_presence_of :close
	validates_uniqueness_of :company_id, :scope => :date
	validates_numericality_of :open, :high, :low, :close, :adjusted_close, :volume, :sma_50, :sma_100, :sma_200, :allow_nil => true

	belongs_to :company
end
