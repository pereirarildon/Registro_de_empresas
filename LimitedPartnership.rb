require_relative 'Company.rb'

class LimitedPartnership < Company

	attr_accessor :partners, :type

	def	initialize ()
		@partners = []
		@type = type
		super(name, id, status, activity)
	end
end