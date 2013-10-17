class AddAuthAdminToUser < ActiveRecord::Migration
	def change
		add_column :users, :auth , :boolean, default: false
		add_column :users, :admin , :boolean, default: false
	end
end
