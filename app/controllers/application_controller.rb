class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate
    deny_access unless signed_in?
  end

  def signed_in?
    !!current_user
  end

  def deny_access
    store_location
    redirect_to login_path, :notice => "Please sign in to access this page. (#{session[:return_to_url]})"
  end

  def store_location
    session[:return_to_url] = request.url
  end

  def redirect_to_stored_location
    if session[:return_to_url]
      the_uri = session[:return_to_url]
      session[:return_to_url] = nil
      redirect_to the_uri, :notice => "Back to where you were!"
    end
  end

end
