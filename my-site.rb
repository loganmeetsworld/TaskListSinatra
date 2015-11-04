require "sinatra"

class MySite < Sinatra::Base

	def current_db
		@current_db ||= TaskList::Task.new
	end

  get "/" do
  	current_db.get_tasks
    erb :index
  end

end
