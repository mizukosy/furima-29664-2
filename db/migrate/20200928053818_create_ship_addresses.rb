class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|
      t.string  :post_code,       null: false
      t.integer :prefecture,      null: false
      t.string  :city,            null: false
      t.string  :block,           null: false
      t.string  :building
      t.string  :telephone,       null: false
      t.references :purchase,     null: false, forgen_key: true
      t.timestamps
    end
  end
end