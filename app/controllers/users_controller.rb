class UsersController < ApplicationController
  before_action :logged_in_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to chamados_path
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end
  
  private
    
    def user_params
      params.require(:user).permit(:nome, :rf, :password, :password_confirmation)
    end
end