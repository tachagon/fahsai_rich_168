class Zipcode < ApplicationRecord
	has_many :district_zipcodes
	has_many :districts, through: :district_zipcodes
end
