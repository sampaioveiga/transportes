class AddIndexToUsersEmail < ActiveRecord::Migration
	def change
		add_index :users, :email, unique: true
		add_index :users, :numero_mecanografico, unique: true
	end
end
