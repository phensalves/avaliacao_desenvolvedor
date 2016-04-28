class Supplier < ActiveRecord::Base
  def find_supplier(name, address)
    supplier = Supplier.find(name: name, address: address).first
      supplier.nil? ? Supplier.create(name: name, address: address) : supplier 
  end
end
