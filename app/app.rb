require 'sinatra/base'
require './app/models/link'


class BookmarkManager < Sinatra::Base

# set :root, File.dirname(__FILE__)

  get '/' do

    erb :index
  end

  get '/links' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb(:links)
  end

end
