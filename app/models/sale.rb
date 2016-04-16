class Sale < ActiveRecord::Base
	attr_accessor :file_data

  validates :buyer_id, presence: true
  validates :supplier_id, presence: true
  belongs_to :buyer
  belongs_to :supplier

  def import_file(row)
  	row = row.split('\t')

  	self.buyer = row[0]
  	self.description = row[1]
  	self.price = row[2].to_f
  	self.quantity = row[3].to_i
  	self.supplier = row[4]

  	price * quantity if save
  end

  def self.open_file(txt_file)

  end
end
