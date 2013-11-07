class AddValidationToReqperson < ActiveRecord::Migration
	def change
		add_column :reqpeople, :comentario, :string
	end
end
