class UsersController < ApplicationController
  
  def new
  	@title = "Join"
  end

  def show
  	@user = User.find(params[:id])	
  end
  
end
