class ReqmaterialsController < ApplicationController
	before_action :correct_user
	before_action :set_reqmaterial, except: [ :index, :new, :create ]
	before_action :require_admin, only: [ :validate ]

	def index
		@user = User.find(params[:user_id])
		@reqmaterials = @user.reqmaterials.paginate(page: params[:page]).order('data_entrega DESC')
	end

	def show
	end

	def new
		@reqmaterial = @user.reqmaterials.new
		@reqmaterial.user_id ||= current_user.id
		@reqmaterial.local_partida ||= current_user.ulsneunit.id
		@reqmaterial.data_entrega ||= Time.now.tomorrow
		@reqmaterial.estado ||= 0
	end

	def create
		@reqmaterial = @user.reqmaterials.new(reqmaterials_params)
		if @reqmaterial.local_entrega.empty?
			@reqmaterial.local_entrega = params[:outro]
		end
		if @reqmaterial.save
			flash[:alert] = "Requisição submetida. A aguardar validação"
			redirect_to [@user, @reqmaterial]
		else
			flash[:alert] = @reqmaterial.local_entrega
			render 'new'
		end
	end

	def edit
		if @reqmaterial.data_entrega.past? && !current_user.admin?
			flash[:error] = "Esta requisição já não pode ser alterada"
			redirect_to user_reqmaterial_path(@user, @reqmaterial)
		end
	end

	def update
		if @reqmaterial.update(reqmaterials_params)
			flash[:success] = "Requisição atualizada."
			redirect_to [@user, @reqmaterial]
		else
			render 'edit'
		end
	end

	def validate
		@reqmaterial.update_attribute(:estado, params[:estado])
		@reqmaterial.update_attribute(:comentario, params[:comentario])
		flash[:success] = "Validação efectuada"
		redirect_to user_reqmaterial_path(@user, @reqmaterial)
	end


	private
		def reqmaterials_params
			params.require(:reqmaterial).permit(:assunto, :local_partida, :local_entrega, :data_entrega, :urgente, :observacoes, :user_id, :boss_id, :estado, :outro)
		end

		def set_reqmaterial
			@reqmaterial = @user.reqmaterials.find(params[:id])
		end

		def correct_user
			unless current_user.admin?
				@user = User.find(current_user.id)
			else
				@user = User.find(params[:user_id])
			end
    	end

    	def require_admin
			unless current_user.admin 
				redirect_to user_path(current_user)
			end
		end
end
