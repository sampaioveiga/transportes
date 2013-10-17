class UlsneunitsController < ApplicationController
	before_action :require_admin
	before_action :set_ulsneunit, except: [ :index, :new, :create ]

	def index
		@ulsneunits = Ulsneunit.order('nome')
	end

	def new
		@ulsneunit = Ulsneunit.new
	end

	def create
		@ulsneunit = Ulsneunit.new(ulsneunit_params)
		if @ulsneunit.save
			flash[:success] = "Criada nova unidade ULSNE"
			redirect_to ulsneunits_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @ulsneunit.update(ulsneunit_params)
			flash[:success] = "Unidade #{@ulsneunit.nome} atualizada"
			redirect_to ulsneunits_path
		else
			render 'edit'
		end
	end

	private
		def set_ulsneunit
			@ulsneunit = Ulsneunit.find(params[:id])
		end

		def ulsneunit_params
			params.require(:ulsneunit).permit(:nome)
		end

		def require_admin
			unless current_user.admin 
				redirect_to user_path(current_user)
			end
		end
end
