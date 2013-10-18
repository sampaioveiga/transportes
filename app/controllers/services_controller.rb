class ServicesController < ApplicationController
	before_action :require_admin
	before_action :set_service, except: [ :index, :new, :create ]

	def index
		@services = Service.paginate(page: params[:page]).order('nome')
	end

	def show
	end

	def new
		@service = Service.new
	end

	def create
		@service = Service.new(service_params)
		if @service.save
			flash[:success] = "Novo serviço criado"
			redirect_to services_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @service.update(service_params)
			flash[:success] = "Serviço #{@service.nome} atualizado"
			redirect_to service_path(@service)
		else
			render 'edit'
		end
	end

	private
		def set_service
			@service = Service.find(params[:id])
		end

		def service_params
			params.require(:service).permit(:nome)
		end

		def require_admin
			unless current_user.admin 
				redirect_to user_path(current_user)
			end
		end
end
