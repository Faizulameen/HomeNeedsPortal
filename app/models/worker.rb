class Worker < ApplicationRecord
	validates :image, :name, :email, :address, :role, :experience, :phone, presence: true
	#belongs_to :user
	has_many :reviews
	has_many :blocks

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	has_one_attached :image

end
