ENV['RACK_ENV'] ||= "development"
require_relative 'data_mapper_setup'
require 'sinatra/base'

require './app/models/link'
require './app/models/tag'


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
  	link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tag])
    p link.tags << tag
    link.save
  	redirect '/links'
  end

  get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  # @links = if tag == true
  #            tag.links
  #         else
  #           []
          # end
  erb :'links/index'
end

end
