class MusclegroupsController < ApplicationController
	def index
		muscle_groups = Musclegroup.all
		render json: muscle_groups, each_serializer: MusclegroupSerializer
	end
end
