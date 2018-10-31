class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end  
  
  def logged_in?
    !!current_user
  end  

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_tasks = user.tasks.count
  end
end
