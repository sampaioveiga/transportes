class ReqmaterialSerializer < ActiveModel::Serializer
	attributes :start, :title, :url, :color

	def start
		object.data_entrega
	end

	def title
		object.user.nome + "-" + object.assunto
	end

	def url
		user_reqmaterial_path(object.user_id,object)
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
