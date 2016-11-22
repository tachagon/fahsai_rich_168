class Province < ApplicationRecord
	has_many :users
  has_many :amphurs
  
  validates :name, :presence => true
end
