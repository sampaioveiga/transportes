class Ulsneunit < ActiveRecord::Base
	has_many	:users
	has_many	:bosses

	# Validations
	validates :nome,
		presence: { message: "não pode ser nulo" }
end
