class Admin::UsersController < ApplicationController

  before_action :verify_admin

  def index
    @users = User.all

  end

  def create

  end

  def edit

  end

  def destroy
    puts params
    @user = User.find(params[:user_id])
    if current_admin.password == params[:password]
      @user.destroy
      flash[:notice] = "User has been deleted"
      redirect_to admin_users_path
    else
      flash[:alert] = "There was a problem"
      redirect_to admin_users_path
    end

  end

  private

  def verify_admin
    redirect_to root_path unless current_admin
  end

end
