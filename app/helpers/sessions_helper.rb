module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def admin_logged_in?
    current_user.present? and current_user.role == 1
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
