class Exercise < ApplicationRecord
	belongs_to :muscle
	has_many :muscleexercises
	has_many :userworkouts
end
