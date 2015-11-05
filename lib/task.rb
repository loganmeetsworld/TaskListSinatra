module TaskList
	class Task < Database

		def create_task(task_name, task_descr, task_date)
    	@db.execute('
    		INSERT INTO tasks (name, description, date)
    		VALUES(?, ?, ?)
    		;', task_name, task_descr, task_date)
    end

    def get_tasks
			@db.execute('
				SELECT id, name, description, date
				FROM tasks;')
		end

		def mark_complete(id)
			id = id.to_i

			@db.execute("
			UPDATE tasks
			SET date= ?
			WHERE id= ?;", Time.now, id)
		end

		def get_completed
		end

		def delete

		end
	end
end
