class Product < ApplicationRecord
	validates :title, :price, :image, presence: true
	
	belongs_to :category
	has_many :reviewws
    has_many :order_items
    has_many :payments
    has_many :likes
    has_one_attached :image



end


