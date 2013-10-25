class Admin::AdministratorsController < Admin::AdminController
 # before_filter :current_administrator
 # before_filter :authenticate_administrator
  def index
  end

  def show
     @administrator = Administrator.find(params[:id])
  end

  def new
     @administrator = Administrator.new
  end

  def create
     @administrator = Administrator.new(administrator_params)
    if @administrator.save
      redirect_to admin_administrators_path, :notice => "Signed up!"
    else
      render "new"
    end

  end

  private

  def administrator_params
    params.require(:administrator).permit(:admin_email, :admin_name, :password, :password_confirmation)
  end
end
