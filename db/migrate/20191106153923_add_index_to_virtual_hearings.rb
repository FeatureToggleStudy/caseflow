class AddIndexToVirtualHearings < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!
  
  def change
    add_index :virtual_hearings, :alias, algorithm: :concurrently
  end
end
