class Payment < ApplicationRecord
	belongs_to :product
	belongs_to :user

	validates :address, :city, :state, :pin, :cardno, :expyear, :cvv, presence: true

	
	STATUS_OPTIONS = [
		['Not yet Dispatched', 'Not yet Dispatched'],
		['Arrive Tomorrow', 'Arrive Tomorrow'],
		['Dispatch Today', 'Dispatch Today'],
		['Your order Was Shipping','Your order Was Shipping'],
		['Arriving Wednesday', 'Arriving Wednesday'],
		['Arriving Monday', 'Arriving Monday']
	]

	def badge_color
		case status
		when 'Not yet Dispatched'
			'primary'
		when 'Arrive Tomorrow'
			'secondary'
		when 'Dispatch Today'
			'info'
		when 'Your order Was Shipping'
			'success'
		when 'Arriving Wednesday'
			'dark'
		when 'Arriving Monday'
			'dark'
		end
	end

end
