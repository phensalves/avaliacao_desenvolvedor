class Buyer < ActiveRecord::Base
	has_many :sales

  def self.find(name)
    buyer = Buyer.find_by_name(name)
    buyer.nil? ? Buyer.create(name: name) : buyer
  end

end
