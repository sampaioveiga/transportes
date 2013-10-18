class AddUserToBosses < ActiveRecord::Migration
	def change
		add_column :bosses, :user_id, :integer
	end
end
