require_relative 'Company.rb'

class Corporation < Company

	attr_accessor :partners, :type

	def	initialize ()
		@partners = []
		@type = type
		super(name, id, status, activity)
	end
end