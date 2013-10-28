class Boss < ActiveRecord::Base
	belongs_to	:service
	belongs_to	:user
	belongs_to	:ulsneunit
	has_many	:reqmaterials
	has_many	:reqpeople

	# Validations
	validates :service_id,
		presence: { message: "não pode ser nulo" }
	validates :title,
		presence: { message: "não pode ser nulo" }
	validates :user_id,
		presence: { message: "não pode ser nulo" }
	validates :ulsneunit_id,
		presence: { message: "não pode ser nulo" }
end
