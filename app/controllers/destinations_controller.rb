class DestinationsController < ApplicationController
	before_action :require_admin
	before_action :set_destination, only: [ :edit, :update ]

	def index
		@destinations = Destination.order('Destino')
	end

	def new
		@destination = Destination.new
	end

	def create
		@destination = Destination.new(destination_params)
		if @destination.save
			flash[:success] = "Destino criado"
			redirect_to destinations_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @destination.update(destination_params)
			flash[:success] = "Destino atualizado"
			redirect_to destinations_path
		else
			render 'edit'
		end
	end

	private
		def set_destination
			@destination = Destination.find(params[:id])
		end

		def destination_params
			params.require(:destination).permit(:destino)
		end

		def require_admin
			unless current_user.admin 
				redirect_to user_path(current_user)
			end
		end
end
