class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  before_filter :require_login, :only => [:destroy]
  before_filter :require_not_login, :only => [:new, :create]
  
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:notice] = "Logged in successfully."
      redirect_to root_url
    else
      redirect_to login_url
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logged out successfully."
    redirect_to login_url
  end

  private
  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
