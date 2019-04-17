class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :show_user
  def index

  end

  def current_user
    @_current_user ||= session[:current_user_id] and
      User.find_by(id: session[:current_user_id])
  end

  def show_user
    @_current_user ||= session[:show_user_id] and 
      User.find_by(id: session[:show_user_id])
      redirect_to @_current_user
  end
  def is_user_logged_in?
	#complete this method
  if !session[:current_user]
    redirect_to root_path
  end
  end
end
