class UsersController < ApplicationController
	
	private def user_params
		params.permit(:name, :email, :password, :sex, :birthdate, :height, :weight)
	end

	private def find_user
		User.find(params[:id])
	end

	def create
		user = User.new(user_params)
		user.usertype_id = 1
		status = 200
		if user.save
			data = user
		else
			status = 422
			data = { error_message: user.errors.full_messages.to_sentence }
		end
		render status: status, json: data, serializer: UserSerializer
	end

	def update
		user = find_user
		if user.update(user_params)
			data = user
		else
			status = 422
			data = { error_message: user.errors.full_messages.to_sentence }
		end
		render status: status, json: data, serializer: UserSerializer
	end

	def destroy
		user = find_user
		user.destroy
		render status: 204, json: {}
	end

	def show
		user = find_user
		render status: status, json: user, serializer: UserSerializer
	end
end
