class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "Please log in."
    end
  end

  def user_admin
    if !current_user
      flash[:alert] = "Please log in."
    elsif current_user.admin = false
      flash[:alert] = "You have admin access to do that."
    end
  end

end
