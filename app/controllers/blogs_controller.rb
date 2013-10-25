class BlogsController < ApplicationController
  def index
     @user = User.all
     @rel = @user.entries
  end
end
