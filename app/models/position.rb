class Position < ApplicationRecord
  validates :name,
  					:presence => true

  validates :benefit_layer,
  					:presence => true,
  					:numericality => { only_integer: true, greater_than_or_equal_to: 0 }

	validates :min_pv,
						:presence => true,
						:numericality => { only_float: true, greater_than_or_equal_to: 0 }
end
