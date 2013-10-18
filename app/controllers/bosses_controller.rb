class BossesController < ApplicationController
	def index
	end

	def create
		@service = Service.find(params[:service_id])
		@boss = @service.bosses.create(params[:boss].permit(:title, :user_id, :ulsneunit_id))
		redirect_to service_path(@service)
	end

	def destroy
    	@service = Service.find(params[:service_id])
    	@boss = @service.bosses.find(params[:id])
    	@boss.destroy
    	flash[:success] = "Chefia eliminada"
    	redirect_to service_path(@service)
  	end
end
