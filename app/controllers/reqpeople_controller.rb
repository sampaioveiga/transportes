class ReqpeopleController < ApplicationController
	before_action :correct_user
	before_action :set_reqperson, except: [ :index, :new, :create ]
	before_action :require_admin, only: [ :validate ]

	def index
		@user = User.find(params[:user_id])
		@reqpeople = @user.reqpeople.paginate(page: params[:page]).order('data_partida DESC')
	end

	def show
	end
	
	def new
		@reqperson = @user.reqpeople.new
		@reqperson.user_id ||= current_user.id
		@reqperson.local_partida ||= current_user.ulsneunit.id
		@reqperson.data_partida ||= Time.now.tomorrow
		@reqperson.local_retorno ||= current_user.ulsneunit.id
		@reqperson.data_retorno ||= @reqperson.data_partida + 1.hour
		@reqperson.condutor ||= current_user.nome
		@reqperson.numero_passageiros ||= 1
		@reqperson.estado ||= 0
	end

	def create
		@reqperson = @user.reqpeople.new(reqpeople_params)
		if @reqperson.local_destino.empty?
			@reqperson.local_destino = params[:outro]
		end
		if @reqperson.save
			flash[:success] = "Requisição submetida. A aguardar validação"
			redirect_to [@user, @reqperson]
		else
			render 'new'
		end
	end

	def edit
		if @reqperson.data_partida.past? && !current_user.admin?
			flash[:error] = "Esta requisição já não pode ser alterada"
			redirect_to user_reqmperson_path(@user, @reqperson)
		end
	end

	def update
		if @reqperson.update(reqpeople_params)
			flash[:success] = "Requisição atualizada."
			redirect_to [@user, @reqperson]
		else
			render 'edit'
		end
	end

	def validate
		@reqperson.update_attribute(:estado, params[:estado])
		@reqperson.update_attribute(:comentario, params[:comentario])
		flash[:success] = "Validação efectuada"
		redirect_to static_pages_reqpeople_path
	end

	private
		def reqpeople_params
			params.require(:reqperson).permit(:user_id, :boss_id, :assunto, :local_partida, :local_destino, :local_retorno, :condutor, :numero_passageiros, :data_partida, :data_retorno, :observacoes, :estado)
		end

		def set_reqperson
			@reqperson = @user.reqpeople.find(params[:id])
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
