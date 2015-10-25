class Order < ActiveRecord::Base
	# order validations
	validates :address, :city, :country, presence: true

	belongs_to :listing
	# class_name relates buyer and seller as a kind of user
	belongs_to :buyer, class_name: "user"
	belongs_to :seller, class_name: "user"
end
