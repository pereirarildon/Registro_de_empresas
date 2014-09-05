class Company
	attr_accessor :name, :id, :status, :activity

	def initialize (name, id, status, activity)
		@name = name
		@id = id
		@status = status
		@activity = activity
	end
end