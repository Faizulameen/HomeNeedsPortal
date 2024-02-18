class Review < ApplicationRecord
	belongs_to :worker
	belongs_to :user

end
