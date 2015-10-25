class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validation for username not to be blank
  validates :name, presence: true

  # Associations
  # dependent: :destory will destroy any lsiting from a user if his account is deleted
  has_many :listings, dependent: :destroy

  # class_name related sales and purchases as an order type - including foreign key for buyer & seller ids
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
end
