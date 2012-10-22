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

end
