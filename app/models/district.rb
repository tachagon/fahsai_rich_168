class District < ApplicationRecord
  belongs_to :amphur

  has_many :district_zipcodes
  has_many :zipcodes, through: :district_zipcodes
end
