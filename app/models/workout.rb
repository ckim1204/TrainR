class Workout < ApplicationRecord
	validates_uniqueness_of :exerciseids
	has_many :userworkouts
end
