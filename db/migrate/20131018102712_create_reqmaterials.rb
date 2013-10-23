class CreateReqmaterials < ActiveRecord::Migration
  def change
    create_table :reqmaterials do |t|
      t.string :assunto
      t.string :local_partida
      t.string :local_entrega
      t.datetime :data_entrega
      t.boolean :urgente
      t.string :observacoes
      t.references :user, index: true

      t.timestamps
    end
  end
end
