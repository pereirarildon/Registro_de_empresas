require_relative 'Company.rb'

class EIRELI < Company
	attr_accessor :holder, :type

	def	initialize ()
		@holder = holder
		@type = type
		super(name, id, status, activity)
	end
end