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
	unless params[:file] && (tmpfile = params[:file][:tempfile])
		return haml :upload
	end

	gfu = GfileUtils.new(tmpfile)
	parsed_file = gfu.parse
	export = gfu.export(parsed_file)

	send_file "./tmp/export.csv", :filename => "export.csv"
	haml :index
end