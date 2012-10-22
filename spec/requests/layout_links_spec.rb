require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /layout_links" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get layout_links_index_path
      response.status.should be(200)
    end

    it "should have a Welcome page at '/'" do
    	get '/'
    	response.should have_selector('title', :content => "Welcome")
    end
  
    it "should have a Sign In page at '/signin'" do
    	get '/signin'
    	response.should have_selector('title', :content => "Sign In")
    end

    it "should have a Contact page at '/contact'" do
    	get '/contact'
    	response.should have_selector('title', :content => "Join")
   	end

    it "should have a About page at '/about'" do
    	get '/about'
    	response.should have_selector('title', :content => "About")
    end
  end
end
