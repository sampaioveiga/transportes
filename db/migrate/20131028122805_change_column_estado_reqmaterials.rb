class ChangeColumnEstadoReqmaterials < ActiveRecord::Migration
	def change
		change_column :reqmaterials, :estado, :integer
	end
end
