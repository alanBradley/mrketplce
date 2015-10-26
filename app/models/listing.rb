class Listing < ActiveRecord::Base
	# if else to enable localhost pic savings to go to computer and heroku savings go to dropbox - see gitignore file for more detail
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	else
	  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
											:storage => :dropbox,
											:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
											:path => ":style/:id_:filename"
	end

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # data validation for listings  - nothing can be blank
  validates :name, :description, :price, presence: true
  # Check price field is both a number and is positive
  validates :price, numericality: { greater_than: 0 }
  # validation for presence of an image. Don't want listing to be saved with no image. Paperclip documentation
  validates_attachment_presence :image

# Associations
belongs_to :user
belongs_to :category
has_many :orders

searchkick
end
