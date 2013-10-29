class Destination < ActiveRecord::Base
	validates :destino,
		presence: { message: "não pode ser nulo"},
		uniqueness: { message: "já existe na base de dados"}
end
