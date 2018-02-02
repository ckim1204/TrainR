class UsersController < ApplicationController

	before_action :authentication
	
	private def user_params
		params.permit(:name, :email, :password, :sex, :birthdate, :height, :weight)
	end

	private def find_user
		User.find(params[:id])
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

	def current_user
                data = eval(Base64.strict_decode64(request.headers['token'].to_s)) || {}
                User.find_by(email: data[:email])
        end

        def authentication
                render status: 401, json: { error_message: 'Unauthorized' } if current_user.nil?
        end
end
