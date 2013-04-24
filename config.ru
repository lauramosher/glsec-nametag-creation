require 'sinatra'
require 'sinatra/url_for'
require 'sinatra/contrib/all'

set :root, File.dirname(__FILE__)

require './app.rb'

run Sinatra::Application