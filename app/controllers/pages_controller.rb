class PagesController < ApplicationController
  
  def welcome
  @title = "Welcome"
  end

  def signin 
  @title = "Sign In"
  end

  def join
  @title = "Join"
  end

  def about
  @title = "About"
  end

  def contact
  @title = "Contact"
  end

end
