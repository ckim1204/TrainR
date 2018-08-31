class MusclegroupsController < ApplicationController
	def index
		muscle_groups = Musclegroup.all
		muscle_groups.each do |group|
			group.imgURL = "https://s3.us-east-2.amazonaws.com/trainr/" + group.name + ".jpg"
		end
		render json: muscle_groups, each_serializer: MusclegroupSerializer
	end
end
