class StaticPagesController < ApplicationController
	before_action :require_login
	before_action :require_admin

	def index
		@reqmaterials = Reqmaterial.where('data_entrega BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).where('estado = 1').order('data_entrega')
		@reqpeople = Reqperson.where('data_partida BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).where('estado = 1').order('data_partida')
	end



	private
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
end
