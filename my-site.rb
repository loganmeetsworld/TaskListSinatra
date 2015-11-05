require "sinatra"
require "./lib/task.rb"

class MySite < Sinatra::Base

	def current_db
		@current_db ||= TaskList::Task.new
	end

  get "/" do
    @title = "Home"
  	current_db.get_tasks
    erb :index
  end

  get "/add" do
    @title = "Add a Task!"
    erb :add
  end

  post "/add" do
    @task_name = params[:name]
    @task_desc = params[:description]
    @task_date = params[:date]
    current_db.create_task(@task_name, @task_desc, @task_date)
    erb :add
  end

end
