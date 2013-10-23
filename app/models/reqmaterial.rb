class Reqmaterial < ActiveRecord::Base
	belongs_to	:user
	belongs_to	:boss
	has_one		:rmaterialstatus, dependent: :destroy
	#self.per_page = 5

	# Validations
	validates :user_id,
		presence: { message: "não pode ser nulo" }
	validates :boss_id,
		presence: { message: "não pode ser nulo" }
	validates :assunto,
		presence: { message: "não pode ser nulo" }
	validates :local_partida,
		presence: { message: "não pode ser nulo" }
	validates :local_entrega,
		presence: { message: "não pode ser nulo" }
	validate :data_entrega_cannot_be_within_3_hours
	
	def data_entrega_cannot_be_within_3_hours
		unless user.admin?
			data_entrega_limit = Time.now + 3.hours
			if data_entrega.present? && data_entrega < data_entrega_limit
				errors.add(:data_entrega, "não pode ser anterior a #{data_entrega_limit}")
			end
		end
	end
end
