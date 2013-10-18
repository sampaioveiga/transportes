class ReqmaterialsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
	end

	private
		def reqmaterials_params
			params.require(:reqmaterial).permit(:assunto, :local_partida, :local_entrega, :data_entrega, :urgente, :observacoes, :user_id, :boss_id)
		end
end
