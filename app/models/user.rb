class User < ApplicationRecord
	validates_uniqueness_of :email
	validates_presence_of :name, :email, :sex, :birthdate, :height, :weight, :provider
	validates_inclusion_of :provider, :in => %w(device facebook)
	validates_presence_of :password, :if => "provider == 'device'"
	before_save :encrypt_password, :if => "provider == 'device'"

	private def encrypt_password
		self.password = Base64.strict_encode64(password)
	end
end
