class Workout < ApplicationRecord
	self.primary_keys = :workout_id, :exerciseorder
end
