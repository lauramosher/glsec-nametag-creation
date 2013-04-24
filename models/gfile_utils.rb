require 'csv'
require 'open-uri'

class GfileUtils
	def initialize(file)
		@file = file
	end

	def parse
		csv = CSV.parse(@file, :headers => true)
	end

	def export(parsed)
		CSV.open("#{File.dirname(__FILE__)}/../tmp/export.csv", "wb") do |c|
			c << ["First Name", "Last Name", "Organization", "Role"]
			parsed.each do |row|
				data = []

				data << row[4].split(",")[1].strip
				data << row[4].split(",")[0].strip
				data << row[2]

				roles = Role.new
				data << roles.getRole(row[4],row[0])


				c << data
			end
		end
	end
end