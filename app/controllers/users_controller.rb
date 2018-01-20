class UsersController < ApplicationController
	
	private def user_params
		params.require(:user).permit(:name, :email, :password, :sex, :birthdate, :height, :weight)
	end

	def create
		newUser = User.new(user_params)
		newUser.usertype_id = 1
		status = 200
		if newUser.save
			data = newUser.to_json
		else
			status = 422
			data = { error_message: newUser.errors.full_messages.to_sentence }
		end
		render status: status, json: data
	end

	def show
		user = User.find(params[:id])
		render status: status, json: user
	end
end
