class UsersController < ApplicationController
  def new
  	@user=User.new
  end

  def create
  	@user=User.new(params[:user])
  	if @user.save
  		session[:user_id]=@user.id
  		redirect_to root_url
  	else
  		render :action => "new"
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
