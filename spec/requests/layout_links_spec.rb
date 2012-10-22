require 'spec_helper'

describe "LayoutLinks" do
  
    it "should have a Welcome page at '/'" do
    	get '/'
    	response.should have_selector('title', :content => "Welcome")
    end

    it "should have a About page at '/about'" do
    	get '/about'
    	response.should have_selector('title', :content => "About")
    end

    it "should have a Sign Up page at '/signup'" do
    	get '/contact'
    	response.should have_selector('title', :content => "Contact")
    end

end
