require './config/setup.rb'

get '/' do
	haml :index
end

get '/settings' do
	"Settings"
end

get '/upload' do
	haml :upload
end

post '/upload' do
	# To Do
end