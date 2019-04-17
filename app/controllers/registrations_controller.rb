class RegistrationsController < ApplicationController
	def new
	end
	def create
		puts(params)
		@user = User.create(name: params[:registrations][:name], last_name: params[:registrations][:last_name], email: params[:registrations][:email], phone: params[:registrations][:phone], password: params[:registrations][:password], address: params[:registrations][:address])
		if @user.save
			flash[:notice] = "Welcome to the Sample App!"
      		redirect_to @user
      	else
      		flash[:notcie] = "Not correct"
      		render 'new'


      	end	
	end
 	

end
