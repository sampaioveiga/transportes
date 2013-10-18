class AddBossToReqmaterial < ActiveRecord::Migration
	def change
		add_column :reqmaterials, :boss_id, :integer
	end
end
