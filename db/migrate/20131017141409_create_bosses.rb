class CreateBosses < ActiveRecord::Migration
  def change
    create_table :bosses do |t|
      t.references :service, index: true
      t.string :title

      t.timestamps
    end
  end
end
