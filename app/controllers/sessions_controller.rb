class SessionsController < ApplicationController

  def new
  end

  def create
     user = User.authenticate(params[:email], params[:password])
     if user
       session[:user_id] = user.id
       sign_in user
       redirect_back_or user
     else
       flash.now.alert = "Invalid email or password"
       render "new"
     end
  end

  def destroy
     session[:user_id] = nil
     cookies.delete(:user_remember_token)
     redirect_to root_url, :notice => "Logged out!"
  end
end
