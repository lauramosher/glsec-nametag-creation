require 'spec_helper'
require File.join(File.dirname(__FILE__), "../..", "models/role.rb")


describe "Roles" do

	before(:each) do
		@role = Role.new
	end

	context "when given a role" do

		describe "of general registration" do
			it "should return role of Attendee" do
				@role.getRole("Name", "General Registration").should eql("Attendee")
			end
		end

		describe "of early registration" do
			it "should return role of Attendee" do
				@role.getRole("Name", "Early Registration").should eql("Attendee")
			end
		end

		describe "of volunteer" do
			it "should return role of Volunteer" do
				@role.getRole("Name, Bogus", "Volunteer").should eql("Volunteer")
			end

			it "should return role of Moderator if name in hash" do
				@role.getRole("Shier, Randy", "Volunteer").should eql("Moderator")
			end
		end

		describe "of sponsor" do
			it "complimentary should return role of Sponsor" do
				@role.getRole("Name, Bogus", "Sponsor Complimentary").should eql("Sponsor")
			end

			it "guest should return role of Sponsor" do
				@role.getRole("Name, Bogus", "Sponsor Guest").should eql("Sponsor")
			end
		end
	end
end