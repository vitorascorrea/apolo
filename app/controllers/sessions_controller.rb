class SessionsController < ApplicationController
include SessionsHelper
	
  def new
  	redirect_to chamados_path if logged_in?  	
  end

	def create
		user = User.find_by(rf: params[:session][:rf].downcase)
		if user && user.authenticate(params[:session][:password])
		  log_in(user)
		  redirect_to chamados_path
		else
		  render 'new'
		end
	end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
  
end
