class ChangeColumnEstadoReqperson < ActiveRecord::Migration
	def change
		add_column :reqpeople, :estado, :integer
	end
end
