class UsersController < ApplicationController
  
  def new
  	@user = User.new
  	@title = "Join"
  end

  def show
  	@user = User.find(params[:id])
  	@title = @user.first_name
  end
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Welcome!"
  		redirect_to @user
  	else
  		@title = "Join"
  		render 'new'
  	end
  end
end
