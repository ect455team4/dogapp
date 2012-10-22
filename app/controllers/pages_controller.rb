class PagesController < ApplicationController
  
  def welcome
  	@title = "Welcome"
  end

  def about
  	@title = "About"
  end

  def contact
  	@title = "Contact"
  end

end
