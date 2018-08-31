class Muscle < ApplicationRecord
	belongs_to :musclegroup
	has_many :exercises
	has_many :muscleexercises
end
