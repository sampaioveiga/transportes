class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_numero_mecanografico(params[:numero_mecanografico])
		if user && user.authenticate(params[:password]) && user.auth
			session[:user_id] = user.id
			flash[:success] = "Sessão iniciada, #{user.nome}"
			redirect_to root_path
		else
			flash[:error] = "Credenciais inválidas."
			render 'new'
		end
	end

	def destroy
		unless session[:user_id].nil?
			session[:user_id] = nil
			flash[:success] = "Sessão terminada"
		end
		redirect_to login_path
	end
end
