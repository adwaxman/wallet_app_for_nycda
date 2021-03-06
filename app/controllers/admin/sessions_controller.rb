class Admin::SessionsController < ApplicationController

  def new

  end

  def create
    @admin = Admin.find_by(email: params[:email])
    if @admin && @admin.password == params[:password]
      session[:admin_id] = @admin.id
      redirect_to admin_users_path
    else
      flash[:alert] = "There was a problem logging in."
      redirect_to new_admin_session_path
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end

end
