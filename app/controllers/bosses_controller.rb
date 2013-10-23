class BossesController < ApplicationController
	before_actions :set_service
	
	def create
		@boss = @service.bosses.create(params[:boss].permit(:title, :user_id, :ulsneunit_id))
		redirect_to service_path(@service)
	end

	def destroy
    	@boss = @service.bosses.find(params[:id])
    	@boss.destroy
    	flash[:success] = "Chefia eliminada"
    	redirect_to service_path(@service)
  	end

  	private
  		def set_service
  			@service = Service.find(params[:service_id])
  		end
end
