class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
     sign_in @user
     flash[:success] = "Signed In!"
     redirect_to @user
    else
     render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end


private

  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday, :sex, :user_remember_token)
  end

end
