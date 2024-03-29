module SessionsHelper

    def sign_in(user)
    cookies.permanent[:user_remember_token] = user.user_remember_token
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  def signed_in_user
     unless signed_in?
       store_location
       redirect_to log_in_url, notice: "Please sign in."
     end
  end

  def correct_user
     @user = User.find(params[:id])
     redirect_to(log_in_path) unless current_user?(@user)
  end

end
