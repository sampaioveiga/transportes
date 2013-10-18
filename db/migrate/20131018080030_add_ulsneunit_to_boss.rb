class AddUlsneunitToBoss < ActiveRecord::Migration
	def change
		add_column :bosses, :ulsneunit_id, :integer
	end
end
