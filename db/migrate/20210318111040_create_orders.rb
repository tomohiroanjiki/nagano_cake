class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id
      t.string :postal_code
      t.string :delivery_address
      t.string :full_name
      t.integer :shipping
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :status
    end
  end
end
