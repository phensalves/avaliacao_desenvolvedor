class CreateBuyers < ActiveRecord::Migration
  def self.up
    create_table :buyers do |t|
      t.string :name

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :buyers
  end
end
