class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit


  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully! Welcome to MyWallet!"
      redirect_to root_path
    else
      render :new
    end

  end

  def destroy
    @user = current_user
      if @user.destroy
        flash[:notice] = "Account was successfully deleted."
      else
        flash[:alert] = "There was a problem"
        redirect_to users_path(@user)
      end
    session[:user_id] = nil
    redirect_to root_path
  end

  def add_money
    puts '%' * 30
    puts params
    @user = User.find(current_user.id)
    @user.cash_balance += 1
    @user.save
    render layout: false
  end


  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :area_code, :local_exchange, :phone_ending, :password, :password_confirmation)
  end


end
