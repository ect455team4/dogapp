class MicropostsController < ApplicationController
	before_filter :authenticate

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:success] = "Created Post!"
			redirect_to root_path
		else
			render 'pages/contact'
		end
	end

	def destroy
	end

end