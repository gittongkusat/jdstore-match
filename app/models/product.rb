class Product < ApplicationRecord
	validates :title, presence:true
	validates :price, numericality:{:greater_than_or_equal_to => 0}
	validates :quantity, numericality:{:greater_than_or_equal_to => 0}
	mount_uploader :image, ImageUploader
	has_many :seats
	has_many :reviews

	belongs_to :category
	has_many :groupships
	has_many :groups, :through=>:groupships
end
