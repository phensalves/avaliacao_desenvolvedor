class Sale < ActiveRecord::Base
	attr_accessor :file_data

  validates :buyer_id, presence: true
  validates :supplier_id, presence: true
  belongs_to :buyer
  belongs_to :supplier

  def import_file(row)
  	row = row.split('\t')
    fail 'Wrong type!' if row.count != 6

  	self.buyer = Buyer.find(row[0])
  	self.description = row[1]
  	self.price = row[2].to_f
  	self.quantity = row[3].to_i
  	self.supplier = Supplier.find_supplier(row[5], row[4])

  	if save
      price * quantity
    else
      false
    end
  end

  def self.read_data(file)
    file 'Wrong type!' if file.split("\n").count <= 1
    total_cash = 0.0
    file.split("\n").each_with_index do |row, index|
      if index => 0 
        sale = Sale.new
        new_sale = sale.import(row)
        fail "Ops!" if new_sale == false
        total_cash += new_sale.to_f
      end
    end
    total_cash
  end
end
