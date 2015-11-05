require "sqlite3"

module TaskList
  class Database
    def initialize(db_name)
      @db = SQLite3::Database.new(db_name)
    end

    def create_schema
      @db.execute('
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NULL,
        date TEXT NULL
      );')
    end
  end

	class Task < Database

		def create_task(task_name, task_descr, task_date)
    	@db.execute('
    		INSERT INTO tasks (name, description, date)
    		VALUES(?, ?, ?)
    		;', task_name, task_descr, task_date)
    end

    def get_tasks
			@db.execute('
				SELECT name, description, date
				FROM tasks;')
		end
	end

  class TaskObject

    attr_reader :name, :description, :completed_date

    def initialize(name, description, completed_date)
      @name = name
      @description = description
      @completed_date = completed_date
    end

    def self.create_tasks(array)
      array.map { |a| TaskObject.new(a[0], a[1], a[2])  }
    end


  #
  #   def self.all
  #     all_tasks = []
  #     tasks_array = TaskList::TaskObject.current_db.get_tasks
  #     tasks_array.each do |t|
  #       task = TaskList::TaskObject.new(t[0], t[1], t[2])
  #       all_tasks.push(task)
  #     end
  #     return all_tasks
  #   end
  end


end
