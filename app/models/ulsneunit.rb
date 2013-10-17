class Ulsneunit < ActiveRecord::Base
	has_many :users

	# Validations
	validates :nome,
		presence: true
end
