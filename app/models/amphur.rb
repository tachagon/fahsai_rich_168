class Amphur < ApplicationRecord
  belongs_to :province

  has_many :districts
end
