class ExercisesController < ApplicationController
	def index
		muscle_group = Musclegroup.find_by(name: params[:musclegroup])
		muscles = muscle_group.muscles
		exercises = Array.new
		for muscle in muscles
			exercises = exercises + muscle.exercises
		end

		exercise_list = exercises.map do |exercise|
			exercise.imgURL = "https://s3.us-east-2.amazonaws.com/trainr/" + exercise.id.to_s + ".jpg"

			main_muscle = Muscle.find(exercise.muscle_id).name
			sec_musc = Muscleexercise.where("exercise_id = ?", exercise.id)
			secondary_muscles = sec_musc.map do |sm|
				sm_name = Muscle.find(sm.muscle_id).name
				#Rails.logger.info(sm_name)
			end

			{ :exercise => exercise, :main => main_muscle, :secondary => secondary_muscles }
		end

print exercise_list

		render json: { :musclegroup => muscle_group, :exercises => exercise_list}.to_json, each_serializer: ExerciseSerializer
	end
end
