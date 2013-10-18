class Boss < ActiveRecord::Base
	belongs_to	:service
	belongs_to	:user
	belongs_to	:ulsneunit

	# Validations
	validates :service_id,
		presence: true
	validates :title,
		presence: true
	validates :user_id,
		presence: true
	validates :ulsneunit_id,
		presence: true
end
