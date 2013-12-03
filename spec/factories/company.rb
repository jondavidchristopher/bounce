FactoryGirl.define do 
	factory :company do |f| 
		f.ticker { Faker::Company.name.upcase[0..4]  }
		f.name { Faker::Company.name } 
	end 
end