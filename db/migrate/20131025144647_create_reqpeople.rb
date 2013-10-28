class CreateReqpeople < ActiveRecord::Migration
  def change
    create_table :reqpeople do |t|
      t.string :assunto
      t.string :local_partida
      t.string :local_destino
      t.string :local_retorno
      t.string :condutor
      t.integer :numero_passageiros
      t.datetime :data_partida
      t.datetime :data_retorno
      t.string :observacoes
      t.references :user, index: true
      t.references :boss, index: true

      t.timestamps
    end
  end
end
