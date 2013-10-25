class AddEstadoToReqmaterial < ActiveRecord::Migration
	def change
		add_column :reqmaterials, :estado, :string
		add_column :reqmaterials, :comentario, :string
	end
end
