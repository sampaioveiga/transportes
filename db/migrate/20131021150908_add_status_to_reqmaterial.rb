class AddStatusToReqmaterial < ActiveRecord::Migration
	def change
		add_column :reqmaterials, :status, :string
	end
end
