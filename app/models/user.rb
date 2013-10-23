class User < ActiveRecord::Base
	belongs_to	:ulsneunit
	belongs_to	:service
	has_many	:bosses, through: :services
	has_many	:reqmaterials
	before_save { self.email = email.downcase }
	has_secure_password
	#self.per_page = 2

	# Validations
	validates :nome,
		presence: { message: "não pode ser nulo" }
	validates :numero_mecanografico,
		presence: { message: "não pode ser nulo" },
		length: { is: 5, message: "tem de possuir 5 números" },
		uniqueness: { message: "já existe na base de dados" }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
		presence: { message: "não pode ser nulo" },
		uniqueness: { case_sensitive: false, message: "já existe na base de dados" },
		format: { with: VALID_EMAIL_REGEX, message: "formato inválido" }
	validates :service_id,
		presence: { message: "não pode ser nulo" }
	validates :ulsneunit_id,
		presence: { message: "não pode ser nulo" }
	validates :password,
		presence: { message: "não pode ser nulo" },
		on: :create,
		length: { minimum: 5, message: "tem de conter mais de 5 caracteres" }
end
