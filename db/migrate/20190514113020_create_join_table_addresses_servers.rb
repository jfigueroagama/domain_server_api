class CreateJoinTableAddressesServers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :addresses, :servers do |t|
      t.index [:address_id, :server_id]
      t.index [:server_id, :address_id]
    end
  end
end
