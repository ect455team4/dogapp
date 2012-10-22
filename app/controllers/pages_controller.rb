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

  def join
  	@title = "Join"
  end

  def signin
  	@title = "Sign in"
  end
end
