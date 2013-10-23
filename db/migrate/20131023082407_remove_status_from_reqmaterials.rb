class RemoveStatusFromReqmaterials < ActiveRecord::Migration
	def change
		remove_column :reqmaterials, :status
	end
end
