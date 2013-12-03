FactoryGirl.define do 
	factory :company_trade_history do |f| 
		# f.company_id
		f.date { Time.zone.now.to_date }
		f.open { Faker::Number.number(10) }
		f.high { Faker::Number.number(10) }
		f.low { Faker::Number.number(10) }
		f.close { Faker::Number.number(10) }
		f.adjusted_close { Faker::Number.number(10) }
		f.volume { Faker::Number.number(5) }
		f.sma_50 { Faker::Number.number(10) }
		f.sma_100 { Faker::Number.number(10) }
		f.sma_200 { Faker::Number.number(10) }
	end 
end