class User < ApplicationRecord
	validates_presence_of :name, :email, :password, :sex, :birthdate, :height, :weight
	validates_uniqueness_of :email
	before_save :encrypt_password

	private def encrypt_password
		self.password = Base64.strict_encode64(password)
	end
end
