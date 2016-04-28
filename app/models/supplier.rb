class Supplier < ActiveRecord::Base
  def find_supplier(name, address)
    supplier = Supplier.find(name: name, address: address).first
      if supplier.nil? ? Supplier.create(name: name, address: address) : supplier 
  end
end
