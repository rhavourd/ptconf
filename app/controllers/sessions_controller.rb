class SessionsController < ApplicationController
  skip_before_filter :authenticate

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    puts "params[:email]=#{params[:email]}  user=#{user} "
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_stored_location || redirect_to( dashboard_url, notice: "Logged in!" )
    else
      flash.now.alert = "Email or password is invalid."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
