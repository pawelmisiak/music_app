class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password])
    if user.nil?
      flash.now[:errors] = ["Incorrect Email or Password"]
    else
      login_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    if logged_in?
      logout_user!
      redirect_to new_session_url
    else
      redirect_to new_session_url
    end
  end
end
