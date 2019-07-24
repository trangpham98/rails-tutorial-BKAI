class PasswordResetsController < ApplicationController
  def new
  end

  def edit
    reset = "reset"
    @user = User.find_by email: params[:email].downcase
    if @user && @user.authenticated?(reset, params[:id]) && @user.password_reset_expired?
      @user.save_new_password User.digest(params[:tempt_password])
      flash[:info] = "Update your password complete!!!!"
      redirect_to root_url
    else
      flash[:danger] = " Update password fail"
      redirect_to root_url
    end
  end

  def update
  end


  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.create_tempt_password
      @user.send_reset_service
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

end
