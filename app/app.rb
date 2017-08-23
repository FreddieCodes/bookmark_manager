ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './app/models/link'


class BookmarkManager < Sinatra::Base

# set :root, File.dirname(__FILE__)
  get '/links' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
  	erb(:'links/new')
  end

  post '/links' do
  	Link.create(url: params[:url], title: params[:title])
  	redirect '/links'
  end

end
