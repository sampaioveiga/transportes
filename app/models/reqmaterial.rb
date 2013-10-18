class Reqmaterial < ActiveRecord::Base
	belongs_to	:user
	belongs_to	:boss

	# Validations
	validates :user_id,
		presence: true
	validates :boss_id,
		presence: true
	validates :assunto,
		presence: true
	validates :local_partida,
		presence: true
	validates :local_entrega,
		presence: true
	validates :data_entrega,
		presence: true
end
