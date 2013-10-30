class ReqpersonSerializer < ActiveModel::Serializer
	attributes :start, :end, :title, :url, :color

	def start
		object.data_partida
	end

	def end
		object.data_retorno
	end

	def title
		object.user.nome + "-" + object.assunto
	end

	def url
		user_reqperson_path(object.user_id,object)
	end

	def color
		case object.estado
			when 1
				"green"
			when 2
				"red"
			else
				"gray"
		end
	end
end
