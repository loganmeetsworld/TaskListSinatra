module TaskList
	class Task < Database
		attr_reader :id, :name, :descr, :date

		def initialize(id, name, descr, date)
			@id = id
			@name = name
			@descr = descr
			@date = date
		end

		def get_tasks
			@db.execute('
				SELECT name, description, date
				FROM tasks;')
		end
	end
end