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

  def home
  	@title = "Home"
  	if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 20)
    else 
      render 'pages/welcome'
    end
  end
  
end
