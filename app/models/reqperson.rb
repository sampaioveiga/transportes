class Reqperson < ActiveRecord::Base
	belongs_to :user
	belongs_to :boss

	#Validations
	validates :user_id,
		presence: { message: "não pode ser nulo" }
	validates :boss_id,
		presence: { message: "não pode ser nuloasefsf" }
	validates :assunto,
		presence: { message: "não pode ser nulo" }
	validates :local_partida,
		presence: { message: "não pode ser nulo" }
	validates :data_partida,
		presence: { message: "não pode ser nulo" }
	validates :local_destino,
		presence: { message: "não pode ser nulo" }
	validates :local_retorno,
		presence: { message: "não pode ser nulo" }
	validates :data_retorno,
		presence: { message: "não pode ser nulo" }
	validates :condutor,
		presence: { message: "não pode ser nulo" }
	validates :numero_passageiros,
		presence: { message: "não pode ser nulo" },
		numericality: { message: "tem de ser um número inteiro" }
	validate :data_partida_cannot_be_within_timelimit
	validate :data_retorno_cannot_be_prior_to_data_partida
	
	def data_partida_cannot_be_within_timelimit
		unless user.admin?
			case
			when data_partida.to_date < Date.today
				errors.add(:data_partida, "não pode ser anterior a #{Date.tomorrow}")
			when data_partida.to_date == Date.today
				errors.add(:data_partida, "não pode ser anterior a #{Date.tomorrow}")
			when (Time.now.hour > 14 && data_partida.to_date == Date.tomorrow)
				errors.add(:data_partida, "não pode ser anterior a #{Date.tomorrow + 1.day}")
			when (Time.now.friday? && Time.now.hour > 14 && data_partida.to_date == Date.tomorrow + 1.day)
				errors.add(:data_partida, "já não pode marcar para domingo")
			when (Time.now.saturday? && data_partida.to_date == Date.tomorrow)
				errors.add(:data_partida, "já não pode marcar para domingo")
			when (Time.now.saturday? && data_partida.to_date == Date.tomorrow + 1.day)
				errors.add(:data_partida, "já não pode marcar para segunda")
			when (Time.now.sunday? && data_partida.to_date == Date.tomorrow)
				errors.add(:data_partida, "já não pode marcar para segunda")
			end
		end
	end

	def data_retorno_cannot_be_prior_to_data_partida
		if data_retorno.present? && data_retorno < data_partida + 1.hour
			errors.add(:data_retorno, "não pode ser anterior a #{data_partida + 1.hour}")
		end
	end
end
