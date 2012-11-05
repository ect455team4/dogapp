class UsersController < ApplicationController
  before_filter  :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter  :correct_user, :only => [:edit, :update]
  before_filter  :admin_user,   :only => :destroy

  def new
  	@user = User.new
  end

  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.first_name
  end
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to DogApp!"
  		redirect_to @user
    else
      flash.now[:error] = "Invalid email or password combination."
      render '/pages/welcome'
  	end
  end

  def edit
    @title = "Edit User"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated."
      redirect_to @user
    else
      @title = "Edit User"
      render 'edit' 
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Destroyed."
    redirect_to users_path
  end

  private
    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
