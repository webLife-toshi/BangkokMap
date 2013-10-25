class Admin::SessionsController < Admin::AdminController

  def new
  end

  def create
    administrator = Administrator.authenticate(params[:admin_email], params[:password])
    if administrator
      session[:administrator_id] = administrator.id
      redirect_to admin_administrator_path(administrator.id), :notice => "Logged In!"
    else
     flash.now.alert = "Invalid email or password"
     render "new"
    end
  end

  def destroy
    session[:administrator_id] = nil
    redirect_to admin_log_in_path, :notice => "Logged out!"
  end
end
