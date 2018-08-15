class AddDescriptionToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :description, :text
  end
end
