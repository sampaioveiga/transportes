class CreateUlsneunits < ActiveRecord::Migration
  def change
    create_table :ulsneunits do |t|
      t.string :nome

      t.timestamps
    end
  end
end
