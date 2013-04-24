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
		
	end
end