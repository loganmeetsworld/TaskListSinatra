require "sinatra"
require "./lib/task_master.rb"

class MySite < Sinatra::Base

	def current_db
		@current_db ||= TaskList::Task.new("tasks.db")
	end

  def index_stuff
    @title = "Home"
    @tasks = TaskList::TaskObject.create_tasks(current_db.get_tasks)
    erb :index
  end

  get "/" do
    index_stuff
  end

  get "/add" do
    @title = "Add a Task!"
    erb :add
  end

  post "/" do
    @task_name = params[:name]
    @task_desc = params[:description]
    @task_date = params[:date]
    current_db.create_task(@task_name, @task_desc, @task_date)
    index_stuff
  end

end
