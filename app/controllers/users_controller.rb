class UsersController < ApplicationController
  def index
    @users = User.all
  end

#action show get id from post request then find user to show on views
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Sign up successfully."
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:content)
  end
end