class DistrictZipcode < ApplicationRecord
  belongs_to :district
  belongs_to :zipcode
end
