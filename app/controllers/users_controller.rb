class UsersController < ApplicationController
	
	private def user_params
		params.require(:user).permit(:name, :email, :password, :sex, :birthdate, :height, :weight)
	end

	def create
		user = User.new(user_params)
		user.usertype_id = 1
		status = 200
		if user.save
			data = user.to_json
		else
			status = 422
			data = { error_message: user.errors.full_messages.to_sentence }
		end
		render status: status, json: data
	end

	def show
		user = User.find(params[:id])
		render status: status, json: user
	end
end
