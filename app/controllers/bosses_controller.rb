class BossesController < ApplicationController
    before_action :set_service, except: [ :view ]
    before_action :require_boss, only: [ :view ]
	
    def view
        @users = @service.users.order('nome')
        #@req_materials = @service.reqmaterials.all
        #@req_people = @service.reqpeople.all
    end

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

        def require_boss
            @boss = Boss.find_by_user_id(current_user.id)
            if @boss.nil?
                redirect_to root_url
            else
                @service = @boss.service
            end
        end
end
