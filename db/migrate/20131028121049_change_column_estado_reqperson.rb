class ChangeColumnEstadoReqperson < ActiveRecord::Migration
	def change
		change_column :reqpeople, :estado, :integer
	end
end
