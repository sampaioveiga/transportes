class Ulsneunit < ActiveRecord::Base
	has_many	:users
	has_many	:bosses

	# Validations
	validates :nome,
		presence: true
end
