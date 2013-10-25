class EntriesController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update]
  before_action :blog_correct_user,   only: [:edit, :update]

  def index
   if params[:user_id]
     @user = User.find(params[:user_id])
     rel = @user.entries
   else
     rel = Entry
   end
   @entries = rel.readable_for(current_user).order("posted_at DESC").
   paginate(page: params[:page], per_page: 5)
  end

  def show
   @entries = Entry.readable_for(current_user).find(params[:id])
  end

  def new
   @entry = Entry.new(posted_at: Time.current)
  end

  def create
   @entry = Entry.new(entry_params)
   @entry.author = current_user
   if @entry.save
    redirect_to user_entries_path, notice: "create entry"
   else
    render "new"
   end
  end

  def edit
   @entries = Entry.readable_for(current_user).find(params[:id])
  end

private

  def entry_params
     params.require(:entry).permit(:id, :user_id, :title, :content, :status, :posted_at)
  end
end

  def blog_correct_user
     @user = User.find(params[:user_id])
     redirect_to(log_in_path) unless current_user?(@user)
  end

