class Service < ActiveRecord::Base
	has_many	:users, through: :bosses
	has_many	:bosses
	self.per_page = 10
	
	# Validations
	validates :nome,
		presence: { message: "não pode ser nulo" }
end
