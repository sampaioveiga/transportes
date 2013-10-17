class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.integer :numero_mecanografico
      t.string :email
      t.string :contacto

      t.timestamps
    end
  end
end
