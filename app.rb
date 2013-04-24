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
	CSV.open("#{File.dirname(__FILE__)}/tmp/export.csv", "wb") do |c|
		c << ["First Name", "Last Name", "Organization", "Role"]
		parsed_file.each do |row|
			data = []

			data << row[4].split(",")[1].strip
			data << row[4].split(",")[0].strip
			data << row[2]

			roles = Role.new
			data << roles.getRole(row[4],row[0])


			c << data
		end
	end

		send_file "#{File.dirname(__FILE__)}/tmp/export.csv", :filename => "export.csv"

	haml :index
end