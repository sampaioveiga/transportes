class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	has_secure_password

	validates :nome,
		presence: true
	validates :numero_mecanografico,
		presence: true,
		length: { is: 5 },
		uniqueness: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
		presence: true,
		uniqueness: { case_sensitive: false },
		format: { with: VALID_EMAIL_REGEX }
	validates :password,
		presence: true,
		on: :create,
		length: { minimum: 5 }
end
