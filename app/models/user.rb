class User < ApplicationRecord
	validates_uniqueness_of :email
	validates_presence_of :name, :email, :password_digest, :sex, :birthdate, :height, :weight

	has_secure_password

	has_many :userworkouts
end
