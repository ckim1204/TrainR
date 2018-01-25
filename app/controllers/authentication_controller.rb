class AuthenticationController < ApplicationController
	def sign_in
		user = User.find_by(email: params[:email])
		status = 200
		if user.present?
			if user.password = Base64.strict_encode64(params[:password])
				hash = { email: user.email, password: user.password }
				data = { token: Base64.strict_encode64(hash.ts_s) }
			else
				status = 401
				data = { error_message: 'Invalid credentials' }
			end
		else
			status = 401
			data = { error_message: 'Invalid credentials' }
		end
		render status: status, json: data
	end

	def sign_up
		user = User.new(params?)
		status = 200
		if user.save
			user.reload
			hash = { email: user.email, password: user.password }
			data = { token: Base64.strict_encode64(hash.to_s) }
		else
			status = 422
			data = { error_message: user.errors.full_messages.to_sentence }
		end
		render status: status, json: data
	end
end
