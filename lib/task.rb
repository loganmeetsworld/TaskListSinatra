require "database.rb"

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

		def create_task(task_name, task_descr, task_date)
    	@db.execute('
    		INSERT INTO tasks (name, description, date)
    		VALUES(?, ?, ?)
    		;', task_name, task_descr, task_date)
    end

	end
end
