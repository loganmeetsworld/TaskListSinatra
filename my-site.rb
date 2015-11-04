require "sinatra"

class MySite < Sinatra::Base

  get "/" do
    erb :index
  end

end
