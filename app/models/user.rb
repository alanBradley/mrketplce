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
end
