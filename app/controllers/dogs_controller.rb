class DogsController < ApplicationController
  before_filter  :authenticate, :only => [:index, :edit, :update, :destroy, :show]
  before_filter  :authorized_user, :only => [:create, :edit, :update]

  before_filter :load_user

  def index
    @dogs = current_user.dogs.all
  end

  def new
    @dog = current_user.dogs.new
  end

  def create
  	@dog = current_user.dogs.new(params[:dog])
  	if @dog.save
  		redirect_to user_dogs_path(current_user)
  	else
  	render 'new'
    end
  end

  def show
    @dog = current_user.dogs.find(params[:id])
  end

  def edit
    @dog = current_user.dogs.find(params[:id])
  end

  def update 
    @dog = current_user.dogs.find(params[:id])
    if @dog.update_attributes(params[:dog])
      redirect_to user_dogs_path(current_user)
    else
    render 'edit'
    end
  end

  def destroy
    @dog = current_user.dogs.find(params[:id])
    @dog.destroy
    render 'index'
  end

  private

    def load_user
      current_user = User.find(params[:user_id])
    end

    def authorized_user
      current_user = User.find(params[:user_id])
    end

    def authenticate
      deny_access unless signed_in?
    end

end
