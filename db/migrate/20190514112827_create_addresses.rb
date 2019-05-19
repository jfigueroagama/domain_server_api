class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :ip_address

      t.timestamps
    end
  end
end
