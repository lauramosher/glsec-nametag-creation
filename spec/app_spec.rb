require 'spec_helper'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

describe "when accessing index page (get /)" do
	before(:each) { get '/'}
	it "should have OK response" do
		last_response.should be_ok
	end
end