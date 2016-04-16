class Buyer < ActiveRecord::Base
	has_many :sales
end
