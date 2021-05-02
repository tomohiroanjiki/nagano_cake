class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.timestamps
      t.integer :item_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.integer :production_status
    end
  end
end
