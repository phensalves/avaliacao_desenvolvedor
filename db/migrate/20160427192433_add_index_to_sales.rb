class AddIndexToSales < ActiveRecord::Migration
  def self.up
    add_index :sales, :buyer_id
    add_index :sales, :supplier_id
  end

  def self.down
    remove_index :sales, name: :index_sales_on_buyer_id
    remove_index :sales, name: :index_sales_on_supplier_id
  end
end
