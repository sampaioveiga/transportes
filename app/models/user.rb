class User < ActiveRecord::Base
	belongs_to :ulsneunit
	belongs_to :service
	before_save { self.email = email.downcase }
	has_secure_password

	# Validations
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
	validates :service_id,
		presence: true
	validates :ulsneunit_id,
		presence: true
	validates :password,
		presence: true,
		on: :create,
		length: { minimum: 5 }
end
