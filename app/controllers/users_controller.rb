class UsersController < ApplicationController
	before_action :set_user, only: [ :update ]
	before_action :require_login, except: [ :new ]
	before_action :require_admin, only: [ :index ]
	before_action :correct_user, only: [ :show, :edit, :update ]

	def index
		@users = User.order('nome')
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		set_first_user
		if @user.save
			flash[:alert] = "Utilizador criado. Tem de aguardar autorização"
			redirect_to login_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Utilizador atualizado"
			redirect_to users_path
		else
			render 'edit'
		end
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def set_first_user
			if User.first.nil?
				@user.auth = true
				@user.admin = true
			else
				@user.auth = false
				@user.admin = false
			end
		end

		def user_params
			params.require(:user).permit(:nome, :numero_mecanografico, :email, :contacto, :password, :password_confirmation, :auth, :admin)
		end

		def require_login
      		unless logged_in?
          		redirect_to login_path
      		end
    	end

    	def logged_in?
      		!!current_user
    	end

		def require_admin
			unless current_user.admin 
				redirect_to user_path(current_user)
			end
		end

		def correct_user
			unless current_user.admin?
				@user = User.find(current_user.id)
			else
				@user = User.find(params[:id])
			end
    	end
end
