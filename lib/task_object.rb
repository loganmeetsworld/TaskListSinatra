module TaskList
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
  end
end