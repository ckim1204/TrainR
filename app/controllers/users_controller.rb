class UsersController < ApplicationController

	skip_before_action :authenticate_request, only: %i[login register]

	def login
		authenticate params[:email], params[:password]
	end

	def register
		user = User.create(user_params)
		if user.save
			login
		else
			response = { message: user.errors }
			status = :bad
			render json: response, status: status
		end
	end

	def find_user
		User.find(params[:id])
	end

	def update
		user = find_user

		password = user.password_digest

		if user.update(user_params)
			#data = user
			#status = :ok
			if params[:password] = ""
				user.password_digest = password
			end
			show
		else
			#Rails.logger.info(user.errors.messages.inspect)
			data = { message: user.errors.full_messages.to_sentence }
			status = :unprocessable_entity
			render json: data, status: status
		end
	end

	def destroy
		user = find_user
		Userworkout.where(:user_id => user.id).destroy_all
		user.destroy
		render status: :no_content, json: {}
	end

	def show
		user = find_user
		render status: status, json: user, serializer: UserSerializer
	end

	private

	def user_params
                params.permit(:id, :name, :email, :password, :sex, :birthdate, :height, :weight, :musclegroup_plan)
        end

        def authenticate(email, password)
		command = AuthenticateUser.call(email, password)
		token = command.result

		if command.success?
			render json: { user_id: JsonWebToken.decode(token)[:user_id], access_token: token, message: 'Login successful' }, status: :ok
		else
                	render json: { message: command.errors }, status: :unauthorized
		end
        end
end
