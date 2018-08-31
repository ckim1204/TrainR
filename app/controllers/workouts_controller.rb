class WorkoutsController < ApplicationController
	def index
		user = User.find(params[:userid])
		userWorkouts = user.userworkouts
		exercises = Array.new

		for userWorkout in userWorkouts
			exercise = Exercise.find(userWorkout.exercise_id)
			exercise.imgURL = "https://s3.us-east-2.amazonaws.com/trainr/" + exercise.id.to_s + ".jpg"
			exercises << exercise
		end

		render json: {:workouts => userWorkouts, :exercises => exercises}.to_json
	end

	def create
		user = User.find(params[:userid])
		exerciseIds = params[:exerciseids].split(',')
		exerciseRepeats = params[:exerciserepeats].split(';')
		exerciseWeights = params[:exerciseweights].split(';')
		restTimes = params[:resttimes].split(';')
		times = params[:times].split(';')

		if Workout.exists?(:exerciseids => params[:exerciseids])
			workout = Workout.find_by(exerciseids: params[:exerciseids])
		else
			workout = Workout.create(exerciseids: params[:exerciseids])
		end
		
		i = 0
		while i < exerciseIds.length
			exercise = Exercise.find(exerciseIds[i])
			userWorkout = Userworkout.new(repeats: exerciseRepeats[i], weights: exerciseWeights[i], rests: restTimes[i], times: times[i])
			user.userworkouts << userWorkout
			workout.userworkouts << userWorkout
			exercise.userworkouts << userWorkout
			userWorkout.save
			i += 1
		end
	end
end
