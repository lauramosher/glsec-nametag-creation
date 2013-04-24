class Role
	# Eventually these will be set via database... if I'm lucky and have time.
	def initialize
		@roles = {
			"Sponsor Complimentary" => "Sponsor",
			"Sponsor Guest" => "Sponsor",
			"Early Registration" => "Attendee",
			"General Registration" => "Attendee",
			"Speaker" => "Speaker",
			"Student" => "Attendee",
			"Mod" => "Moderator",
			"Board Member" => "GLSEC Organizing Committee",
			"Board" => "GLSEC Organizing Committee",
			"Volunteer" => "Volunteer",
			"Keynote" => "Keynote Speaker"
		}

		@keynote = ["Graham, Dorthy", "Potter, Eric"]

		@moderators = [
			"Shier, Randy",
			"Limbaugh, Dave",
			"Geer, Rob",
			"Fernando, Christian"
		]
	end

	# Finds GLSEC role for Name Tag based on Registration Type from RegOnline and
	# Concatenated Last Name, First Name.
	# If I do this later, I'll use RegOnline's registrant ID for truly unique mappings.
	def getRole(name, role)
		if @moderators.include?(name)
			role = "Mod"
		elsif @keynote.include?(name)
			role = "Keynote"
		end

		@roles[role]
	end
end