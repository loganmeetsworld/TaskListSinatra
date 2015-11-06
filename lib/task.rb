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
			@db.execute("
				UPDATE tasks
				SET date= ?
				WHERE id= ?;", "#{Time.now}", id.to_i)
		end

		def delete(id)
			@db.execute("
				DELETE FROM tasks
				WHERE id=?;", id.to_i)
		end

		def remove_date(id)
			@db.execute("
				UPDATE tasks
				SET date = ?
				WHERE id = ?", nil, id.to_i)
		end
	end
end
