class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :CreateSuppliers
  end
end
