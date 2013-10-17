class AddUlsneunitToUser < ActiveRecord::Migration
  def change
    add_reference :users, :ulsneunit, index: true
  end
end
