class Block < ApplicationRecord
	belongs_to :worker
	belongs_to :user

	validates :address, :city, :state, :pin, :cardno, :expyear, :cvv, presence: true

	STATUS_OPTIONS = [
		['Will be reach in 1 hour', 'Will be reach in 1 hour'],
		['Will be reach in 2 hour', 'Will be reach in 2 hour'],
		['Will be reach in 3 hour','Will be reach in 3 hour']
	]

	def badge_color
		case status
		when 'Will be reach in 1 hour'
			'secondary'
		when 'Will be reach in 2 hour'
			'info'
		when 'Will be reach in 3 hour'
			'success'
		end
	end
end
