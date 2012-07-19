class SessionsController < ApplicationController
  skip_before_filter :authenticate

  def new
  end

  def create
    user = User.active.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_stored_location || redirect_to( dashboard_url, notice: "Logged in!" )
    else
      redirect_to new_session_url, :alert => "Email or password is invalid."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
