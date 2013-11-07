class AddEstadoToReqmaterial < ActiveRecord::Migration
	def change
		add_column :reqmaterials, :estado, :integer
		add_column :reqmaterials, :comentario, :string
	end
end
