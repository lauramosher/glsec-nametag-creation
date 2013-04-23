require 'sinatra'
require 'sinatra/url_for'
require 'rack/test'
require 'rspec'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
set :views, File.dirname(__FILE__) + "/../views"


def app
	Sinatra::Application
end

RSpec.configure do |config|
	config.include Rack::Test::Methods
end