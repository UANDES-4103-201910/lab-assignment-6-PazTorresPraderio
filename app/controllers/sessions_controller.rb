class SessionsController < ApplicationController
	def new
	end
	def create
		puts params
		user = User.find_by(email: params[:session][:email])
		if !user.nil? and user.authenticate(params[:session][:password]) and user.this_user(params[:session][:user_id])
			session[:current_user_id] = user.id
			cookies.permanent.signed[:user_id] = user.id
			flash[:notice] = "Correct"
			logger.debug "successfully logged in"
			redirect_to :controller => 'users', :action => 'show', id: user.id
			#redirect_to root_url
		else
			flash[:notice] = "Not Correct"
			logger.debug "login failed"
			redirect_to "/"

		end

	end

	def destroy
		@_current_user = session[:current_user_id] = nil
		cookies.permanent.signed[:user_id] = nil
		flash[:notice] = "Log out"
    	redirect_to root_url

	end
end
